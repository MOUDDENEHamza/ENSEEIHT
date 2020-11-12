/**
 */
package petrinet;


/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>Edge</b></em>'.
 * <!-- end-user-doc -->
 *
 * <p>
 * The following features are supported:
 * </p>
 * <ul>
 *   <li>{@link petrinet.Edge#getCible <em>Cible</em>}</li>
 *   <li>{@link petrinet.Edge#getSource <em>Source</em>}</li>
 *   <li>{@link petrinet.Edge#getTokens <em>Tokens</em>}</li>
 *   <li>{@link petrinet.Edge#getType <em>Type</em>}</li>
 * </ul>
 *
 * @see petrinet.PetrinetPackage#getEdge()
 * @model
 * @generated
 */
public interface Edge extends PetriNetElement {
	/**
	 * Returns the value of the '<em><b>Cible</b></em>' reference.
	 * It is bidirectional and its opposite is '{@link petrinet.Node#getLinkToCible <em>Link To Cible</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Cible</em>' reference.
	 * @see #setCible(Node)
	 * @see petrinet.PetrinetPackage#getEdge_Cible()
	 * @see petrinet.Node#getLinkToCible
	 * @model opposite="linkToCible"
	 * @generated
	 */
	Node getCible();

	/**
	 * Sets the value of the '{@link petrinet.Edge#getCible <em>Cible</em>}' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Cible</em>' reference.
	 * @see #getCible()
	 * @generated
	 */
	void setCible(Node value);

	/**
	 * Returns the value of the '<em><b>Source</b></em>' reference.
	 * It is bidirectional and its opposite is '{@link petrinet.Node#getLinkToSource <em>Link To Source</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Source</em>' reference.
	 * @see #setSource(Node)
	 * @see petrinet.PetrinetPackage#getEdge_Source()
	 * @see petrinet.Node#getLinkToSource
	 * @model opposite="linkToSource"
	 * @generated
	 */
	Node getSource();

	/**
	 * Sets the value of the '{@link petrinet.Edge#getSource <em>Source</em>}' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Source</em>' reference.
	 * @see #getSource()
	 * @generated
	 */
	void setSource(Node value);

	/**
	 * Returns the value of the '<em><b>Tokens</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Tokens</em>' attribute.
	 * @see #setTokens(int)
	 * @see petrinet.PetrinetPackage#getEdge_Tokens()
	 * @model
	 * @generated
	 */
	int getTokens();

	/**
	 * Sets the value of the '{@link petrinet.Edge#getTokens <em>Tokens</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Tokens</em>' attribute.
	 * @see #getTokens()
	 * @generated
	 */
	void setTokens(int value);

	/**
	 * Returns the value of the '<em><b>Type</b></em>' attribute.
	 * The literals are from the enumeration {@link petrinet.arc_type}.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Type</em>' attribute.
	 * @see petrinet.arc_type
	 * @see #setType(arc_type)
	 * @see petrinet.PetrinetPackage#getEdge_Type()
	 * @model
	 * @generated
	 */
	arc_type getType();

	/**
	 * Sets the value of the '{@link petrinet.Edge#getType <em>Type</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Type</em>' attribute.
	 * @see petrinet.arc_type
	 * @see #getType()
	 * @generated
	 */
	void setType(arc_type value);

} // Edge
