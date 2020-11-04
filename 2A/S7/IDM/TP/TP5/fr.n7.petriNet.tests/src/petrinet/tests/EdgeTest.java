/**
 */
package petrinet.tests;

import junit.framework.TestCase;

import junit.textui.TestRunner;

import petrinet.Edge;
import petrinet.PetrinetFactory;

/**
 * <!-- begin-user-doc -->
 * A test case for the model object '<em><b>Edge</b></em>'.
 * <!-- end-user-doc -->
 * @generated
 */
public class EdgeTest extends TestCase {

	/**
	 * The fixture for this Edge test case.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	protected Edge fixture = null;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static void main(String[] args) {
		TestRunner.run(EdgeTest.class);
	}

	/**
	 * Constructs a new Edge test case with the given name.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EdgeTest(String name) {
		super(name);
	}

	/**
	 * Sets the fixture for this Edge test case.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	protected void setFixture(Edge fixture) {
		this.fixture = fixture;
	}

	/**
	 * Returns the fixture for this Edge test case.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	protected Edge getFixture() {
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
		setFixture(PetrinetFactory.eINSTANCE.createEdge());
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

} //EdgeTest
