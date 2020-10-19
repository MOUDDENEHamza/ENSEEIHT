interface Incrémenteur extends Runnable{
    void incr();
    /* Boucle d'incrémentation effectuée par un processus (thread).
     * Le principe/objectif est de réaliser cette boucle, comportant un même nombre
     * d'incrémentations en suivant différents schémas pour maintenir la cohérence
     * (ou pas) et de comparer ces schémas en termes de correction et d'efficacité
     */
}

