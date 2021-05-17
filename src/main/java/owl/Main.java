package owl_api_big;

import org.semanticweb.owlapi.formats.OWLXMLDocumentFormat;
import org.semanticweb.owlapi.model.*;
import org.semanticweb.owlapi.apibinding.OWLManager;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;

// http://syllabus.cs.manchester.ac.uk/pgt/2020/COMP62342/introduction-owl-api-msc.pdf
public class Main {
    public static void main(String[] args) {
	
        try {
	    // parse argument value
	    int size = 0;
	    try {
		size = Integer.parseInt(args[0]);
	    } catch (NumberFormatException e) {
		System.out.println(e.getMessage());
		System.exit(1);
	    }

	    // check it is a valid number
	    if (size <= 0)
		System.exit(1);
	    
            // create an ontology
            OWLOntologyManager man = OWLManager.createOWLOntologyManager();
            OWLOntology o = man.createOntology();

            // create classes
	    OWLDataFactory df = o.getOWLOntologyManager().getOWLDataFactory();
            for (int i = 1; i <= size; i++) {
                // create class
                OWLClass clazz = df.getOWLClass("https://www.example.com/o" + i);
                // create declaration axiom
                OWLDeclarationAxiom da = df.getOWLDeclarationAxiom(clazz);
                // add to ontology
                o.add(da);
            }

            // print ontology
            man.saveOntology(o, new OWLXMLDocumentFormat(), System.out);

        } catch (OWLOntologyCreationException | OWLOntologyStorageException e) {
            e.printStackTrace();
        }
    }
}
