package simplepdl.utils;

import java.util.*;
import java.util.Collections;

import org.eclipse.emf.common.util.URI;
import org.eclipse.emf.ecore.resource.Resource;
import org.eclipse.emf.ecore.resource.ResourceSet;
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl;
import org.eclipse.emf.ecore.xmi.impl.XMIResourceFactoryImpl;

import petrinet.*;
import simplepdl.*;
import simplepdl.Process;

public class SimplePDL2PetriNet {
    
    static Network nw;
    static PetrinetFactory pnFactory;
    
    static Map<String, Place> finisheds = new HashMap<String, Place>();
    static Map<String, Place> starteds = new HashMap<String, Place>();
    static Map<String, Transition> starts = new HashMap<String, Transition>();
    static Map<String, Transition> finishs = new HashMap<String, Transition>();
    static Map<String, Place> ressources = new HashMap<String, Place>();
    
    public static void convertWorkDefinition(WorkDefinition wd) {
        
        /* Création des places associées à la WorkDefinition */

        // La première pour le cas non commencé
        Place p_ready = pnFactory.createPlace();
        p_ready.setName(wd.getName() + "_ready");
        p_ready.setTokensCount(1);
        nw.getNodes().add(p_ready);
        
        // La deuxième pour savoir si commencé
        Place p_started = pnFactory.createPlace();
        p_started.setName(wd.getName() + "_started");
        p_started.setTokensCount(0);
        nw.getNodes().add(p_started);
        
        // La troisième pour le cas en cours
        Place p_running = pnFactory.createPlace();
        p_running.setName(wd.getName() + "_running");
        p_running.setTokensCount(0);
        nw.getNodes().add(p_running);
        
        // La dernière pour le cas terminé
        Place p_finished = pnFactory.createPlace();
        p_finished.setName(wd.getName() + "_ready");
        p_finished.setTokensCount(0);
        nw.getNodes().add(p_finished);
        
        /* Création des transitions associées à la WorkDefinition */

        // La première pour commencer la WorkDefinition
        Transition t_start = pnFactory.createTransition();
        t_start.setName(wd.getName() + "_start");
        nw.getNodes().add(t_start);
        
        // La deuxième pour finir la WorkDefinition
        Transition t_finish = pnFactory.createTransition();
        t_finish.setName(wd.getName() + "_finish");
        nw.getNodes().add(t_finish);
        
        /* Création des arcs entre Places et Transitions associées à la WorkDefinition */
        
        Arc a_ready_start = pnFactory.createArc();
        a_ready_start.setSource(p_ready);
        a_ready_start.setTarget(t_start);
        nw.getArcs().add(a_ready_start);
        
        Arc a_start_started = pnFactory.createArc();
        a_start_started.setSource(t_start);
        a_start_started.setTarget(p_started);
        nw.getArcs().add(a_start_started);
        

        Arc a_start_running = pnFactory.createArc();
        a_start_running.setSource(t_start);
        a_start_running.setTarget(p_running);
        nw.getArcs().add(a_start_running);
        
        Arc a_running_finish = pnFactory.createArc();
        a_running_finish.setSource(p_running);
        a_running_finish.setTarget(t_finish);
        nw.getArcs().add(a_running_finish);
        
        Arc a_finish_finished = pnFactory.createArc();
        a_finish_finished.setSource(t_finish);
        a_finish_finished.setTarget(p_finished);
        nw.getArcs().add(a_finish_finished);
        
        // Mettre à jour les maps
        starteds.put(wd.getName(), p_started);
        finisheds.put(wd.getName(), p_finished);
        starts.put(wd.getName(), t_start);
        finishs.put(wd.getName(), t_finish);
    }
    
    public static void convertRessource(Ressource rs) {
        
        /* Création de la place associée à la Ressource */

        // La place pour le nombre de ressources disponibles
        Place p_ressource = pnFactory.createPlace();
        p_ressource.setName(rs.getName() + "_ressource");
        p_ressource.setTokensCount(rs.getCount());
        nw.getNodes().add(p_ressource);
        
        // Mettre à jour les maps
        ressources.put(rs.getName(), p_ressource);
        
        // Convertir les Allocations en lien avec la Ressource
        for (Allocation al : rs.getAllocations()) {
        	System.out.println("New Ressource");
            convertAllocation(al);
        }
    }
    
    public static void convertAllocation(Allocation al) {
        Place p_ressource = ressources.get(al.getRessource().getName() + "_ressource");
        Transition t_start = starts.get(al.getWorkDefinition().getName() + "_start");
        Transition t_finish = finishs.get(al.getWorkDefinition().getName() + "_finish");
    	
        /* Création des arcs associées à l'Allocation */
    	
    	// Ressource -> Start
    	Arc a_allocate = pnFactory.createArc();
    	a_allocate.setSource(p_ressource);
    	a_allocate.setTarget(t_start);
    	a_allocate.setTokensCount(al.getCount());
        nw.getArcs().add(a_allocate);
    	
    	// Finish -> Ressource
    	Arc a_unallocate = pnFactory.createArc();
    	a_unallocate.setSource(t_finish);
    	a_unallocate.setTarget(p_ressource);
    	a_unallocate.setTokensCount(al.getCount());
        nw.getArcs().add(a_unallocate);
    }
    
    public static void convertWorkSequence(WorkSequence ws) {
        Arc a = pnFactory.createArc();
        a.setReadOnly(true);
        
        if (ws.getLinkType() == WorkSequenceType.START_TO_START) {
            a.setSource(starteds.get(ws.getPredecessor().getName()));
            a.setTarget(starts.get(ws.getSuccessor().getName()));
        }
        else if(ws.getLinkType() == WorkSequenceType.START_TO_FINISH) {
            a.setSource(starteds.get(ws.getPredecessor().getName()));
            a.setTarget(finishs.get(ws.getSuccessor().getName()));
        }
        else if(ws.getLinkType() == WorkSequenceType.FINISH_TO_START) {
            a.setSource(finisheds.get(ws.getPredecessor().getName()));
            a.setTarget(starts.get(ws.getSuccessor().getName()));
        }
        else {
            a.setSource(finisheds.get(ws.getPredecessor().getName()));
            a.setTarget(finishs.get(ws.getSuccessor().getName()));
        }
        
        nw.getArcs().add(a);
    }

    public static void main(String[] args) {
    	String sample = "DeveloppementSimple";
    	if(args.length != 0) {
    		sample = args[0];
    	}
        /* Chargement des packages */
    	SimplepdlPackage spPackageInstance = SimplepdlPackage.eINSTANCE;
    	PetrinetPackage pnPackageInstance = PetrinetPackage.eINSTANCE;
        
        /* Chargement des ressources */
        Resource.Factory.Registry reg = Resource.Factory.Registry.INSTANCE;
        Map<String, Object> m = reg.getExtensionToFactoryMap();
        m.put("xmi", new XMIResourceFactoryImpl());
                
        // Créer un objet resourceSetImpl qui contiendra le modèle
        ResourceSet resSet = new ResourceSetImpl();

        // Charger le modèle en entrée
        URI modelURI = URI.createURI("models/" + sample + ".xmi");
        Resource resource = resSet.getResource(modelURI, true);
        
        // Récupération du Process (racine du SimplePDL)
        Process proc = (Process)resource.getContents().get(0);
        
        // Créer le modèle en sortie
        URI pnURI = URI.createURI("models/" + sample + "_Petri.xmi");
        Resource pn = resSet.createResource(pnURI);
        
        // Remplir le modèle en sortie
        pnFactory = PetrinetFactory.eINSTANCE;
        nw = pnFactory.createNetwork();
        nw.setName(proc.getName());
        pn.getContents().add(nw);
        
        // Convertir les WorkDefinitions
        for (Object o : proc.getProcessElements()) {
            if (o instanceof WorkDefinition) {
            	System.out.println("New WorkDefinition");
                convertWorkDefinition((WorkDefinition)o);
            }
        }
        // Convertir les Ressources
        for (Object o : proc.getProcessElements()) {
            if (o instanceof Ressource) {
            	System.out.println("New Ressource");
                convertRessource((Ressource)o);
            }
        }
        // Convertir les WorkSequences
        for (Object o : proc.getProcessElements()) {
            if (o instanceof WorkSequence) {
            	System.out.println("New WorkSequence");
                convertWorkSequence((WorkSequence)o);
            }
        }
        
        try {
            pn.save(Collections.EMPTY_MAP);
        } catch(Exception e) {
            e.printStackTrace();
        }
    }

}
