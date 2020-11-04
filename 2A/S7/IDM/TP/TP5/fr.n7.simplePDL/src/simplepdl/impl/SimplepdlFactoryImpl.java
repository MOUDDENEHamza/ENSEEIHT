/**
 */
package simplepdl.impl;

import org.eclipse.emf.ecore.EClass;
import org.eclipse.emf.ecore.EDataType;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.emf.ecore.EPackage;

import org.eclipse.emf.ecore.impl.EFactoryImpl;

import org.eclipse.emf.ecore.plugin.EcorePlugin;

import simplepdl.Allocate;
import simplepdl.Guidance;
import simplepdl.ProcessElement;
import simplepdl.Ressource;
import simplepdl.SimplepdlFactory;
import simplepdl.SimplepdlPackage;
import simplepdl.WorkDefinition;
import simplepdl.WorkSequence;
import simplepdl.WorkSequenceType;

/**
 * <!-- begin-user-doc -->
 * An implementation of the model <b>Factory</b>.
 * <!-- end-user-doc -->
 * @generated
 */
public class SimplepdlFactoryImpl extends EFactoryImpl implements SimplepdlFactory {
	/**
	 * Creates the default factory implementation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static SimplepdlFactory init() {
		try {
			SimplepdlFactory theSimplepdlFactory = (SimplepdlFactory)EPackage.Registry.INSTANCE.getEFactory(SimplepdlPackage.eNS_URI);
			if (theSimplepdlFactory != null) {
				return theSimplepdlFactory;
			}
		}
		catch (Exception exception) {
			EcorePlugin.INSTANCE.log(exception);
		}
		return new SimplepdlFactoryImpl();
	}

	/**
	 * Creates an instance of the factory.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public SimplepdlFactoryImpl() {
		super();
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public EObject create(EClass eClass) {
		switch (eClass.getClassifierID()) {
			case SimplepdlPackage.PROCESS: return createProcess();
			case SimplepdlPackage.WORK_DEFINITION: return createWorkDefinition();
			case SimplepdlPackage.WORK_SEQUENCE: return createWorkSequence();
			case SimplepdlPackage.PROCESS_ELEMENT: return createProcessElement();
			case SimplepdlPackage.GUIDANCE: return createGuidance();
			case SimplepdlPackage.RESSOURCE: return createRessource();
			case SimplepdlPackage.ALLOCATE: return createAllocate();
			default:
				throw new IllegalArgumentException("The class '" + eClass.getName() + "' is not a valid classifier");
		}
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public Object createFromString(EDataType eDataType, String initialValue) {
		switch (eDataType.getClassifierID()) {
			case SimplepdlPackage.WORK_SEQUENCE_TYPE:
				return createWorkSequenceTypeFromString(eDataType, initialValue);
			default:
				throw new IllegalArgumentException("The datatype '" + eDataType.getName() + "' is not a valid classifier");
		}
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public String convertToString(EDataType eDataType, Object instanceValue) {
		switch (eDataType.getClassifierID()) {
			case SimplepdlPackage.WORK_SEQUENCE_TYPE:
				return convertWorkSequenceTypeToString(eDataType, instanceValue);
			default:
				throw new IllegalArgumentException("The datatype '" + eDataType.getName() + "' is not a valid classifier");
		}
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public simplepdl.Process createProcess() {
		ProcessImpl process = new ProcessImpl();
		return process;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public WorkDefinition createWorkDefinition() {
		WorkDefinitionImpl workDefinition = new WorkDefinitionImpl();
		return workDefinition;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public WorkSequence createWorkSequence() {
		WorkSequenceImpl workSequence = new WorkSequenceImpl();
		return workSequence;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public ProcessElement createProcessElement() {
		ProcessElementImpl processElement = new ProcessElementImpl();
		return processElement;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public Guidance createGuidance() {
		GuidanceImpl guidance = new GuidanceImpl();
		return guidance;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public Ressource createRessource() {
		RessourceImpl ressource = new RessourceImpl();
		return ressource;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public Allocate createAllocate() {
		AllocateImpl allocate = new AllocateImpl();
		return allocate;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public WorkSequenceType createWorkSequenceTypeFromString(EDataType eDataType, String initialValue) {
		WorkSequenceType result = WorkSequenceType.get(initialValue);
		if (result == null) throw new IllegalArgumentException("The value '" + initialValue + "' is not a valid enumerator of '" + eDataType.getName() + "'");
		return result;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public String convertWorkSequenceTypeToString(EDataType eDataType, Object instanceValue) {
		return instanceValue == null ? null : instanceValue.toString();
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public SimplepdlPackage getSimplepdlPackage() {
		return (SimplepdlPackage)getEPackage();
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @deprecated
	 * @generated
	 */
	@Deprecated
	public static SimplepdlPackage getPackage() {
		return SimplepdlPackage.eINSTANCE;
	}

} //SimplepdlFactoryImpl
