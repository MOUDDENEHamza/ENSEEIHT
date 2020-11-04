/**
 */
package simplepdl;


/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>Work Sequence</b></em>'.
 * <!-- end-user-doc -->
 *
 * <p>
 * The following features are supported:
 * </p>
 * <ul>
 *   <li>{@link simplepdl.WorkSequence#getLinkType <em>Link Type</em>}</li>
 *   <li>{@link simplepdl.WorkSequence#getPredecessor <em>Predecessor</em>}</li>
 *   <li>{@link simplepdl.WorkSequence#getSuccessor <em>Successor</em>}</li>
 * </ul>
 *
 * @see simplepdl.SimplepdlPackage#getWorkSequence()
 * @model
 * @generated
 */
public interface WorkSequence extends ProcessElement {
	/**
	 * Returns the value of the '<em><b>Link Type</b></em>' attribute.
	 * The literals are from the enumeration {@link simplepdl.WorkSequenceType}.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Link Type</em>' attribute.
	 * @see simplepdl.WorkSequenceType
	 * @see #setLinkType(WorkSequenceType)
	 * @see simplepdl.SimplepdlPackage#getWorkSequence_LinkType()
	 * @model required="true"
	 * @generated
	 */
	WorkSequenceType getLinkType();

	/**
	 * Sets the value of the '{@link simplepdl.WorkSequence#getLinkType <em>Link Type</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Link Type</em>' attribute.
	 * @see simplepdl.WorkSequenceType
	 * @see #getLinkType()
	 * @generated
	 */
	void setLinkType(WorkSequenceType value);

	/**
	 * Returns the value of the '<em><b>Predecessor</b></em>' reference.
	 * It is bidirectional and its opposite is '{@link simplepdl.WorkDefinition#getLinksToSuccessors <em>Links To Successors</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Predecessor</em>' reference.
	 * @see #setPredecessor(WorkDefinition)
	 * @see simplepdl.SimplepdlPackage#getWorkSequence_Predecessor()
	 * @see simplepdl.WorkDefinition#getLinksToSuccessors
	 * @model opposite="linksToSuccessors" required="true"
	 * @generated
	 */
	WorkDefinition getPredecessor();

	/**
	 * Sets the value of the '{@link simplepdl.WorkSequence#getPredecessor <em>Predecessor</em>}' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Predecessor</em>' reference.
	 * @see #getPredecessor()
	 * @generated
	 */
	void setPredecessor(WorkDefinition value);

	/**
	 * Returns the value of the '<em><b>Successor</b></em>' reference.
	 * It is bidirectional and its opposite is '{@link simplepdl.WorkDefinition#getLinksToPredecessors <em>Links To Predecessors</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Successor</em>' reference.
	 * @see #setSuccessor(WorkDefinition)
	 * @see simplepdl.SimplepdlPackage#getWorkSequence_Successor()
	 * @see simplepdl.WorkDefinition#getLinksToPredecessors
	 * @model opposite="linksToPredecessors" required="true"
	 * @generated
	 */
	WorkDefinition getSuccessor();

	/**
	 * Sets the value of the '{@link simplepdl.WorkSequence#getSuccessor <em>Successor</em>}' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Successor</em>' reference.
	 * @see #getSuccessor()
	 * @generated
	 */
	void setSuccessor(WorkDefinition value);

} // WorkSequence
