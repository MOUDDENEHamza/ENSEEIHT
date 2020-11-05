/*
 * generated by Xtext 2.17.1
 */
package fr.n7;

import com.google.inject.Guice;
import com.google.inject.Injector;
import fr.n7.pDL1.PDL1Package;
import org.eclipse.emf.ecore.EPackage;
import org.eclipse.emf.ecore.resource.Resource;
import org.eclipse.xtext.ISetup;
import org.eclipse.xtext.common.TerminalsStandaloneSetup;
import org.eclipse.xtext.resource.IResourceFactory;
import org.eclipse.xtext.resource.IResourceServiceProvider;

@SuppressWarnings("all")
public class PDL1StandaloneSetupGenerated implements ISetup {

	@Override
	public Injector createInjectorAndDoEMFRegistration() {
		TerminalsStandaloneSetup.doSetup();

		Injector injector = createInjector();
		register(injector);
		return injector;
	}
	
	public Injector createInjector() {
		return Guice.createInjector(new PDL1RuntimeModule());
	}
	
	public void register(Injector injector) {
		if (!EPackage.Registry.INSTANCE.containsKey("http://www.n7.fr/PDL1")) {
			EPackage.Registry.INSTANCE.put("http://www.n7.fr/PDL1", PDL1Package.eINSTANCE);
		}
		IResourceFactory resourceFactory = injector.getInstance(IResourceFactory.class);
		IResourceServiceProvider serviceProvider = injector.getInstance(IResourceServiceProvider.class);
		
		Resource.Factory.Registry.INSTANCE.getExtensionToFactoryMap().put("pdl1", resourceFactory);
		IResourceServiceProvider.Registry.INSTANCE.getExtensionToFactoryMap().put("pdl1", serviceProvider);
	}
}
