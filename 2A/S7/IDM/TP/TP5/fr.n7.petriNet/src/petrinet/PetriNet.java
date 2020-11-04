/**
 */
package petrinet;

import org.eclipse.emf.common.util.EList;

import org.eclipse.emf.ecore.EObject;

/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>Petri Net</b></em>'.
 * <!-- end-user-doc -->
 *
 * <p>
 * The following features are supported:
 * </p>
 * <ul>
 *   <li>{@link petrinet.PetriNet#getName <em>Name</em>}</li>
 *   <li>{@link petrinet.PetriNet#getPetrinetelement <em>Petrinetelement</em>}</li>
 *   <li>{@link petrinet.PetriNet#getEdge <em>Edge</em>}</li>
 * </ul>
 *
 * @see petrinet.PetrinetPackage#getPetriNet()
 * @model
 * @generated
 */
public interface PetriNet extends EObject {
	/**
	 * Returns the value of the '<em><b>Name</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Name</em>' attribute.
	 * @see #setName(String)
	 * @see petrinet.PetrinetPackage#getPetriNet_Name()
	 * @model
	 * @generated
	 */
	String getName();

	/**
	 * Sets the value of the '{@link petrinet.PetriNet#getName <em>Name</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Name</em>' attribute.
	 * @see #getName()
	 * @generated
	 */
	void setName(String value);

	/**
	 * Returns the value of the '<em><b>Petrinetelement</b></em>' containment reference list.
	 * The list contents are of type {@link petrinet.Node}.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Petrinetelement</em>' containment reference list.
	 * @see petrinet.PetrinetPackage#getPetriNet_Petrinetelement()
	 * @model containment="true"
	 * @generated
	 */
	EList<Node> getPetrinetelement();

	/**
	 * Returns the value of the '<em><b>Edge</b></em>' containment reference list.
	 * The list contents are of type {@link petrinet.Edge}.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Edge</em>' containment reference list.
	 * @see petrinet.PetrinetPackage#getPetriNet_Edge()
	 * @model containment="true"
	 * @generated
	 */
	EList<Edge> getEdge();

} // PetriNet
