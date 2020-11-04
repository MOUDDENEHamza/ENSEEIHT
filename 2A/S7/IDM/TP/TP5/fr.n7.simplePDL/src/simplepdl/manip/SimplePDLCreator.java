package simplepdl.manip;

import java.io.IOException;
import java.util.Collections;
import java.util.Map;

import org.eclipse.emf.common.util.URI;
import org.eclipse.emf.ecore.resource.Resource;
import org.eclipse.emf.ecore.resource.ResourceSet;
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl;
import org.eclipse.emf.ecore.xmi.impl.XMIResourceFactoryImpl;

import simplepdl.Process;
import simplepdl.WorkDefinition;
import simplepdl.WorkSequence;
import simplepdl.WorkSequenceType;
import simplepdl.SimplepdlFactory;
import simplepdl.SimplepdlPackage;

public class SimplePDLCreator {

	public static void main(String[] args) {
		
		// Charger le package SimplePDL afin de l'enregistrer dans le registre d'Eclipse.
		SimplepdlPackage packageInstance = SimplepdlPackage.eINSTANCE;
		
		// Enregistrer l'extension ".xmi" comme devant Ãªtre ouverte Ã 
		// l'aide d'un objet "XMIResourceFactoryImpl"
		Resource.Factory.Registry reg = Resource.Factory.Registry.INSTANCE;
		Map<String, Object> m = reg.getExtensionToFactoryMap();
		m.put("xmi", new XMIResourceFactoryImpl());
		
		// CrÃ©er un objet resourceSetImpl qui contiendra une ressource EMF (le modÃ¨le)
		ResourceSet resSet = new ResourceSetImpl();

		// DÃ©finir la ressource (le modÃ¨le)
		URI modelURI = URI.createURI("models/SimplePDLCreator_Created_Process.xmi");
		Resource resource = resSet.createResource(modelURI);
		
		// La fabrique pour fabriquer les Ã©lÃ©ments de SimplePDL
	    SimplepdlFactory myFactory = SimplepdlFactory.eINSTANCE;

		// CrÃ©er un Ã©lÃ©ment Process
		Process process = myFactory.createProcess();
		process.setName("Mon premier processus");
		
		// Ajouter le Process dans le modÃ¨le
		resource.getContents().add(process);

		// Ajouter deux WorkDefinitions
	    WorkDefinition wd1 = myFactory.createWorkDefinition();
	    wd1.setName("Ma premiÃ¨re WorkDefinition, quelle Ã©motion");
	    
	    WorkDefinition wd2 = myFactory.createWorkDefinition();
	    wd2.setName("Ma deuxiÃ¨me WorkDefinition, toujours autant d'Ã©motion");
	    
	    process.getProcessElements().add(wd1);
	    process.getProcessElements().add(wd2);
	    
		// Ajouter une WorkSequence entre les deux WorkDefinitions
	    WorkSequence seq = myFactory.createWorkSequence();
	    seq.setPredecessor(wd1);
	    seq.setSuccessor(wd2);
	    seq.setLinkType(WorkSequenceType.FINISH_TO_FINISH);
	    
	    process.getProcessElements().add(seq);
	    
		// Ajouter une deuxiÃ¨me WorkSequence entre les deux WorkDefinitions
	    WorkSequence seq2 = myFactory.createWorkSequence();
	    seq2.setPredecessor(wd1);
	    seq2.setSuccessor(wd2);
	    seq2.setLinkType(WorkSequenceType.START_TO_START);
	    
	    process.getProcessElements().add(seq2);
	    
		
		// Sauver la ressource
	    try {
	    	resource.save(Collections.EMPTY_MAP);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
