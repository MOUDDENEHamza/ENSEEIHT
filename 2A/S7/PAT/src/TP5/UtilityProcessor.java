package TP5;

import javax.annotation.processing.*;
import javax.lang.model.SourceVersion;
import javax.lang.model.element.*;
import java.util.*;
import javax.tools.Diagnostic.Kind;

/**
 * Check that a class marked {@code @Utility} is indeed a utility class.
 */
@SupportedAnnotationTypes("Utility")
@SupportedSourceVersion(SourceVersion.RELEASE_11)
public class UtilityProcessor extends AbstractProcessor {

    @Override
    public boolean process(
            Set<? extends TypeElement> annotations,
            RoundEnvironment roundingEnvironment) {
        Messager messager = processingEnv.getMessager();
        messager.printMessage(Kind.NOTE,
                "UtilityProcessor executed.");
        messager.printMessage(Kind.WARNING,
                "The provided UtilityProcessor class is wrong.  Correct it!");
        for (TypeElement te : annotations) {
            for (Element elt : roundingEnvironment.getElementsAnnotatedWith(te)) {
                if (elt.getKind() != ElementKind.CLASS) {    // elt is a class
                    messager.printMessage(Kind.WARNING, "This is not a class", elt);
                } else {
                    boolean isFinal = elt.getModifiers().contains(Modifier.FINAL);
                    if (!(isFinal)) { // If the class is not final
                        messager.printMessage(Kind.WARNING, "this class is not final");
                    }
                    // If the class is final
                    // Check that enclosed elements are static
                    boolean isStatic = true;
                    List<Element> elementList = (List<Element>) elt.getEnclosingElement();
                    for (Element e : elementList) {
                        if (!e.getModifiers().contains(Modifier.STATIC)) {
                            isStatic = false;
                            break;
                        }
                    }
                    if (!isStatic) {
                        messager.printMessage(Kind.WARNING, "There is an enclosed element that is not static", elt);
                    } else {
                        messager.printMessage(Kind.ERROR,
                                "@Utility applies to class only:", elt);
                    }

                }
            }
        }
        return true;
    }

}