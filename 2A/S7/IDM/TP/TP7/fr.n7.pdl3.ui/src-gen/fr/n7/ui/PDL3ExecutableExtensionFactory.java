/*
 * generated by Xtext 2.17.1
 */
package fr.n7.ui;

import com.google.inject.Injector;
import fr.n7.pdl3.ui.internal.Pdl3Activator;
import org.eclipse.core.runtime.Platform;
import org.eclipse.xtext.ui.guice.AbstractGuiceAwareExecutableExtensionFactory;
import org.osgi.framework.Bundle;

/**
 * This class was generated. Customizations should only happen in a newly
 * introduced subclass. 
 */
public class PDL3ExecutableExtensionFactory extends AbstractGuiceAwareExecutableExtensionFactory {

	@Override
	protected Bundle getBundle() {
		return Platform.getBundle(Pdl3Activator.PLUGIN_ID);
	}
	
	@Override
	protected Injector getInjector() {
		Pdl3Activator activator = Pdl3Activator.getInstance();
		return activator != null ? activator.getInjector(Pdl3Activator.FR_N7_PDL3) : null;
	}

}