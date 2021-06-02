package fr.n7.stl.block.ast.classElement;

import java.util.List;

import fr.n7.stl.block.ast.instruction.declaration.ParameterDeclaration;
import fr.n7.stl.block.ast.type.PartialType;
import fr.n7.stl.block.ast.type.Type;
import fr.n7.stl.util.Pair;

public class Signature {

    protected Type type;

    protected Pair<String, PartialType> identifiant;

    protected List<ParameterDeclaration> parameters;

    public Signature(Type _type, Pair<String, PartialType> _identifiant, List<ParameterDeclaration> _parameters) {
        this.type = _type;
        this.identifiant = _identifiant;
        this.parameters = _parameters;
    }

    public String toString() {
        String _result = type.toString() + " " + this.identifiant.getLeft() + "(";
        for (ParameterDeclaration _parameter : this.parameters) {
            _result += _parameter;
        }
        return _result + "";
    }

}
