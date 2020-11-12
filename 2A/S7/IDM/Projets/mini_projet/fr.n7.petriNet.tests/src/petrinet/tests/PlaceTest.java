/**
 */
package petrinet.tests;

import junit.textui.TestRunner;

import petrinet.PetrinetFactory;
import petrinet.Place;

/**
 * <!-- begin-user-doc -->
 * A test case for the model object '<em><b>Place</b></em>'.
 * <!-- end-user-doc -->
 * @generated
 */
public class PlaceTest extends NodeTest {

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static void main(String[] args) {
		TestRunner.run(PlaceTest.class);
	}

	/**
	 * Constructs a new Place test case with the given name.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public PlaceTest(String name) {
		super(name);
	}

	/**
	 * Returns the fixture for this Place test case.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	protected Place getFixture() {
		return (Place)fixture;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see junit.framework.TestCase#setUp()
	 * @generated
	 */
	@Override
	protected void setUp() throws Exception {
		setFixture(PetrinetFactory.eINSTANCE.createPlace());
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

} //PlaceTest
