/**
 */
package petrinet.impl;

import java.util.Collection;

import org.eclipse.emf.common.notify.Notification;
import org.eclipse.emf.common.notify.NotificationChain;

import org.eclipse.emf.common.util.EList;

import org.eclipse.emf.ecore.EClass;
import org.eclipse.emf.ecore.InternalEObject;

import org.eclipse.emf.ecore.impl.ENotificationImpl;
import org.eclipse.emf.ecore.impl.MinimalEObjectImpl;

import org.eclipse.emf.ecore.util.EObjectWithInverseResolvingEList;
import org.eclipse.emf.ecore.util.InternalEList;

import petrinet.Edge;
import petrinet.Node;
import petrinet.PetrinetPackage;

/**
 * <!-- begin-user-doc -->
 * An implementation of the model object '<em><b>Node</b></em>'.
 * <!-- end-user-doc -->
 * <p>
 * The following features are implemented:
 * </p>
 * <ul>
 *   <li>{@link petrinet.impl.NodeImpl#getName <em>Name</em>}</li>
 *   <li>{@link petrinet.impl.NodeImpl#getLinkToSource <em>Link To Source</em>}</li>
 *   <li>{@link petrinet.impl.NodeImpl#getLinkToCible <em>Link To Cible</em>}</li>
 * </ul>
 *
 * @generated
 */
public abstract class NodeImpl extends MinimalEObjectImpl.Container implements Node {
	/**
	 * The default value of the '{@link #getName() <em>Name</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see #getName()
	 * @generated
	 * @ordered
	 */
	protected static final String NAME_EDEFAULT = null;

	/**
	 * The cached value of the '{@link #getName() <em>Name</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see #getName()
	 * @generated
	 * @ordered
	 */
	protected String name = NAME_EDEFAULT;

	/**
	 * The cached value of the '{@link #getLinkToSource() <em>Link To Source</em>}' reference list.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see #getLinkToSource()
	 * @generated
	 * @ordered
	 */
	protected EList<Edge> linkToSource;

	/**
	 * The cached value of the '{@link #getLinkToCible() <em>Link To Cible</em>}' reference list.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see #getLinkToCible()
	 * @generated
	 * @ordered
	 */
	protected EList<Edge> linkToCible;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	protected NodeImpl() {
		super();
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	protected EClass eStaticClass() {
		return PetrinetPackage.Literals.NODE;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public String getName() {
		return name;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public void setName(String newName) {
		String oldName = name;
		name = newName;
		if (eNotificationRequired())
			eNotify(new ENotificationImpl(this, Notification.SET, PetrinetPackage.NODE__NAME, oldName, name));
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EList<Edge> getLinkToSource() {
		if (linkToSource == null) {
			linkToSource = new EObjectWithInverseResolvingEList<Edge>(Edge.class, this, PetrinetPackage.NODE__LINK_TO_SOURCE, PetrinetPackage.EDGE__SOURCE);
		}
		return linkToSource;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EList<Edge> getLinkToCible() {
		if (linkToCible == null) {
			linkToCible = new EObjectWithInverseResolvingEList<Edge>(Edge.class, this, PetrinetPackage.NODE__LINK_TO_CIBLE, PetrinetPackage.EDGE__CIBLE);
		}
		return linkToCible;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@SuppressWarnings("unchecked")
	@Override
	public NotificationChain eInverseAdd(InternalEObject otherEnd, int featureID, NotificationChain msgs) {
		switch (featureID) {
			case PetrinetPackage.NODE__LINK_TO_SOURCE:
				return ((InternalEList<InternalEObject>)(InternalEList<?>)getLinkToSource()).basicAdd(otherEnd, msgs);
			case PetrinetPackage.NODE__LINK_TO_CIBLE:
				return ((InternalEList<InternalEObject>)(InternalEList<?>)getLinkToCible()).basicAdd(otherEnd, msgs);
		}
		return super.eInverseAdd(otherEnd, featureID, msgs);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public NotificationChain eInverseRemove(InternalEObject otherEnd, int featureID, NotificationChain msgs) {
		switch (featureID) {
			case PetrinetPackage.NODE__LINK_TO_SOURCE:
				return ((InternalEList<?>)getLinkToSource()).basicRemove(otherEnd, msgs);
			case PetrinetPackage.NODE__LINK_TO_CIBLE:
				return ((InternalEList<?>)getLinkToCible()).basicRemove(otherEnd, msgs);
		}
		return super.eInverseRemove(otherEnd, featureID, msgs);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public Object eGet(int featureID, boolean resolve, boolean coreType) {
		switch (featureID) {
			case PetrinetPackage.NODE__NAME:
				return getName();
			case PetrinetPackage.NODE__LINK_TO_SOURCE:
				return getLinkToSource();
			case PetrinetPackage.NODE__LINK_TO_CIBLE:
				return getLinkToCible();
		}
		return super.eGet(featureID, resolve, coreType);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@SuppressWarnings("unchecked")
	@Override
	public void eSet(int featureID, Object newValue) {
		switch (featureID) {
			case PetrinetPackage.NODE__NAME:
				setName((String)newValue);
				return;
			case PetrinetPackage.NODE__LINK_TO_SOURCE:
				getLinkToSource().clear();
				getLinkToSource().addAll((Collection<? extends Edge>)newValue);
				return;
			case PetrinetPackage.NODE__LINK_TO_CIBLE:
				getLinkToCible().clear();
				getLinkToCible().addAll((Collection<? extends Edge>)newValue);
				return;
		}
		super.eSet(featureID, newValue);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public void eUnset(int featureID) {
		switch (featureID) {
			case PetrinetPackage.NODE__NAME:
				setName(NAME_EDEFAULT);
				return;
			case PetrinetPackage.NODE__LINK_TO_SOURCE:
				getLinkToSource().clear();
				return;
			case PetrinetPackage.NODE__LINK_TO_CIBLE:
				getLinkToCible().clear();
				return;
		}
		super.eUnset(featureID);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public boolean eIsSet(int featureID) {
		switch (featureID) {
			case PetrinetPackage.NODE__NAME:
				return NAME_EDEFAULT == null ? name != null : !NAME_EDEFAULT.equals(name);
			case PetrinetPackage.NODE__LINK_TO_SOURCE:
				return linkToSource != null && !linkToSource.isEmpty();
			case PetrinetPackage.NODE__LINK_TO_CIBLE:
				return linkToCible != null && !linkToCible.isEmpty();
		}
		return super.eIsSet(featureID);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public String toString() {
		if (eIsProxy()) return super.toString();

		StringBuilder result = new StringBuilder(super.toString());
		result.append(" (name: ");
		result.append(name);
		result.append(')');
		return result.toString();
	}

} //NodeImpl
