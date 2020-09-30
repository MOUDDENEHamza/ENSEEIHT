package simplepdl.manip;

import java.util.Collections;
import java.util.Map;

import org.eclipse.emf.common.util.URI;
import org.eclipse.emf.ecore.resource.Resource;
import org.eclipse.emf.ecore.resource.ResourceSet;
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl;
import org.eclipse.emf.ecore.xmi.impl.XMIResourceFactoryImpl;

import simplepdl.Process;
import simplepdl.SimplepdlFactory;
import simplepdl.SimplepdlPackage;
import simplepdl.WorkDefinition;
import simplepdl.WorkSequence;
import simplepdl.WorkSequenceType;

public class SimplePDLManipulator {

	public static void main(String[] args) {
		
		// Chargement du package SimplePDL afin de l'enregistrer dans le registre d'Eclipse.
		SimplepdlPackage packageInstance = SimplepdlPackage.eINSTANCE;
		
		// Enregistrer l'extension ".xmi" comme devant Ãªtre ouverte Ã 
		// l'aide d'un objet "XMIResourceFactoryImpl"
		Resource.Factory.Registry reg = Resource.Factory.Registry.INSTANCE;
		Map<String, Object> m = reg.getExtensionToFactoryMap();
		m.put("xmi", new XMIResourceFactoryImpl());
		
		// CrÃ©er un objet resourceSetImpl qui contiendra une ressource EMF (notre modÃ¨le)
		ResourceSet resSet = new ResourceSetImpl();

		// Charger la ressource (notre modÃ¨le)
		URI modelURI = URI.createURI("models/SimplePDLCreator_Created_Process.xmi");
		Resource resource = resSet.getResource(modelURI, true);
		
		// RÃ©cupÃ©rer le premier Ã©lÃ©ment du modÃ¨le (Ã©lÃ©ment racine)
		Process process = (Process) resource.getContents().get(0);
		
		/**
		 * Manipulation de notre instance
		 */
		// AccÃ©der aux informations du processus chargÃ©
	    System.out.println("Processus : " + process.getName());
	    // Naviguer dans les rÃ©fÃ©rences
	    Integer nbPE = process.getProcessElements().size();
	    System.out.println("Nombre de ProcessElement dans " + process.getName() + " : " + nbPE);

		// Afficher les sous-activitÃ©s
		System.out.println("Les sous-activitÃ©s sont :");
		for (Object o : process.getProcessElements()) {
			if (o instanceof WorkDefinition) {
				WorkDefinition wd = (WorkDefinition) o;
				System.out.println("  - " + wd.getName());
			}
		}
	    
	}

}
