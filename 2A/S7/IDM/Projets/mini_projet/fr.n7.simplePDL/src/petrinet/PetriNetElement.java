/**
 */
package petrinet;

import org.eclipse.emf.ecore.EObject;

/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>Petri Net Element</b></em>'.
 * <!-- end-user-doc -->
 *
 * <p>
 * The following features are supported:
 * </p>
 * <ul>
 *   <li>{@link petrinet.PetriNetElement#getNet <em>Net</em>}</li>
 * </ul>
 *
 * @see petrinet.PetrinetPackage#getPetriNetElement()
 * @model abstract="true"
 * @generated
 */
public interface PetriNetElement extends EObject {
	/**
	 * Returns the value of the '<em><b>Net</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Net</em>' reference.
	 * @see #setNet(PetriNet)
	 * @see petrinet.PetrinetPackage#getPetriNetElement_Net()
	 * @model
	 * @generated
	 */
	PetriNet getNet();

	/**
	 * Sets the value of the '{@link petrinet.PetriNetElement#getNet <em>Net</em>}' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Net</em>' reference.
	 * @see #getNet()
	 * @generated
	 */
	void setNet(PetriNet value);

} // PetriNetElement
