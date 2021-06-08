package fr.n7.stl.block.ast.classElement;

import fr.n7.stl.block.ast.Block;
import fr.n7.stl.block.ast.SemanticsUndefinedException;
import fr.n7.stl.block.ast.instruction.declaration.ParameterDeclaration;
import fr.n7.stl.block.ast.scope.Declaration;
import fr.n7.stl.block.ast.scope.HierarchicalScope;
import fr.n7.stl.block.ast.scope.SymbolTable;
import fr.n7.stl.block.ast.type.AtomicType;
import fr.n7.stl.block.ast.type.Type;
import fr.n7.stl.tam.ast.Fragment;
import fr.n7.stl.tam.ast.Register;
import fr.n7.stl.tam.ast.TAMFactory;
import fr.n7.stl.util.Logger;

public class MethodDeclaration implements ClassElement, Declaration {

    protected AccessRight accessRight;

    protected ElementState state;

    protected Signature signature;

    protected Block corps;

    protected SymbolTable parametersTable;

    protected int offset;

    public MethodDeclaration(AccessRight _accessRight, ElementState _state, Signature _signature, Block _corps) {
        this.accessRight = _accessRight;
        this.state = _state;
        this.signature = _signature;
        this.corps = _corps;
    }

    public String toString() {
        return this.accessRight.toString() + " " + this.state.toString() + " " + this.signature.toString() + " "
                + corps;
    }

    public AccessRight getAccessRight() {
        return this.accessRight;
    }

    public Signature getSignature() {
        return this.signature;
    }

    @Override
    public String getName() {
        return this.signature.getName();
    }

    @Override
    public Type getType() {
        return this.signature.getType();
    }

    @Override
    public boolean collectAndBackwardResolve(HierarchicalScope<Declaration> _scope) {
        String id = signature.identifiant.getLeft();
        String name = signature.identifiant.getLeft();
        if (this.signature.parameters != null) {
            for (ParameterDeclaration p : this.signature.parameters) {
                name += p.getType().toString();
            }
        }
        signature.identifiant.setLeft(name);
        if (((HierarchicalScope<Declaration>) _scope).accepts(this)) {
            _scope.register(this);
            SymbolTable tableParametres = new SymbolTable(_scope);
            boolean result = true;
            if (this.signature.getParameters() != null) {
                for (ParameterDeclaration d : this.signature.getParameters()) {
                    tableParametres.register(d);
                }
            }
            this.parametersTable = tableParametres;
            result = this.corps.collect(tableParametres);
            return result;
        } else {
            Logger.error("The method identifier " + id + " is already defined.");
            return false;
        }
    }

    @Override
    public boolean fullResolve(HierarchicalScope<Declaration> _scope) {
        SymbolTable.methodDeclaration = this;
        return this.corps.resolve(this.parametersTable);
    }

    @Override
    public boolean checkType() {
        boolean _result = true;
        SymbolTable.methodDeclaration = this;
        if (this.signature.parameters != null) {
            for(ParameterDeclaration parameterDeclaration : this.signature.parameters) {
                if (parameterDeclaration.getType().equalsTo(AtomicType.ErrorType)) {
                    Logger.error(parameterDeclaration + " is not compatible with parameters type.");
                    _result = false;
                }
            }
        }
		_result = _result && corps.checkType();
        return _result;
    }

    @Override
    public int allocateMemory(Register _register, int _offset) {
        this.offset = 0;
		for (ParameterDeclaration p : this.signature.getParameters()) {
			offset += p.getType().length();
		}
		this.corps.allocateMemory(Register.LB, this.offset);
		return 0;
    }

    @Override
    public Fragment getCode(TAMFactory _factory) {
        Fragment _result = _factory.createFragment();
        _result.append(this.corps.getCode(_factory));
		_result.addPrefix("begin:" + this.signature.getName());
        if (this.signature.getType() == AtomicType.VoidType){
			_result.add(_factory.createReturn(0, this.offset));
		}
		_result.addSuffix("end:" + this.signature.getName());
        return _result;
    }

}
