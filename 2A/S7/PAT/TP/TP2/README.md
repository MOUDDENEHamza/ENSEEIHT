# TP2 : JUnit et introspection

## Exercice 1 : La classe Lanceur

<ol>
    <li>
    On utilise les méthodes getMethod et getMethods plutôt que les méthodes
    getDeclaredMethod et getDeclaredMethods, car getDeclaredMethod et 
    getDeclaredMethods ne retournent pas les méthodes héritées, mais elles ont
    l'avantage de lister toutes les méthodes publiques, private, etc...
    </li>
    <li>
    Si la classe de test peut ne pas définir la méthode nettoyer, on va 
    s'attendre à un retour de d'exception, sinon on lance les tests sans
    les exécuter.
    </li>
</ol>