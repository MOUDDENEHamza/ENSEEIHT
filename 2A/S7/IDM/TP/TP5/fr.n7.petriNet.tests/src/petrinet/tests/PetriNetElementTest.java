/**
 */
package petrinet.tests;

import junit.framework.TestCase;

import junit.textui.TestRunner;

import petrinet.PetriNetElement;
import petrinet.PetrinetFactory;

/**
 * <!-- begin-user-doc -->
 * A test case for the model object '<em><b>Petri Net Element</b></em>'.
 * <!-- end-user-doc -->
 * @generated
 */
public class PetriNetElementTest extends TestCase {

	/**
	 * The fixture for this Petri Net Element test case.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	protected PetriNetElement fixture = null;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static void main(String[] args) {
		TestRunner.run(PetriNetElementTest.class);
	}

	/**
	 * Constructs a new Petri Net Element test case with the given name.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public PetriNetElementTest(String name) {
		super(name);
	}

	/**
	 * Sets the fixture for this Petri Net Element test case.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	protected void setFixture(PetriNetElement fixture) {
		this.fixture = fixture;
	}

	/**
	 * Returns the fixture for this Petri Net Element test case.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	protected PetriNetElement getFixture() {
		return fixture;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see junit.framework.TestCase#setUp()
	 * @generated
	 */
	@Override
	protected void setUp() throws Exception {
		setFixture(PetrinetFactory.eINSTANCE.createPetriNetElement());
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see junit.framework.TestCase#tearDown()
	 * @generated
	 */
	@Override
	protected void tearDown() throws Exception {
		setFixture(null);
	}

} //PetriNetElementTest
