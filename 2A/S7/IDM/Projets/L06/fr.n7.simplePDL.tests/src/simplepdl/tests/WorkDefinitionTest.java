/**
 */
package simplepdl.tests;

import junit.textui.TestRunner;

import simplepdl.SimplepdlFactory;
import simplepdl.WorkDefinition;

/**
 * <!-- begin-user-doc -->
 * A test case for the model object '<em><b>Work Definition</b></em>'.
 * <!-- end-user-doc -->
 * @generated
 */
public class WorkDefinitionTest extends ProcessElementsTest {

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static void main(String[] args) {
		TestRunner.run(WorkDefinitionTest.class);
	}

	/**
	 * Constructs a new Work Definition test case with the given name.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public WorkDefinitionTest(String name) {
		super(name);
	}

	/**
	 * Returns the fixture for this Work Definition test case.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private WorkDefinition getFixture() {
		return (WorkDefinition)fixture;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see junit.framework.TestCase#setUp()
	 * @generated
	 */
	protected void setUp() throws Exception {
		setFixture(SimplepdlFactory.eINSTANCE.createWorkDefinition());
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see junit.framework.TestCase#tearDown()
	 * @generated
	 */
	protected void tearDown() throws Exception {
		setFixture(null);
	}

} //WorkDefinitionTest
