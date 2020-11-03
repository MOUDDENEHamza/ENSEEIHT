// Time-stamp: <02 mai 2013 10:25 queinnec@enseeiht.fr>
// V0.1 10/15 (PM, correction gauche<->droite)

import Synchro.Simulateur;

public class Main {

    /* Initialisé depuis la ligne de commande */
    public static int nbPhilosophes;

    // Chaque philosophe mange entre MinDelayMange et MaxDelayMange secondes,
    // et pense entre MinDelayPense et MaxDelayPense (les bornes incluses).
    public final static int MinDelayMange = 5;
    public final static int MaxDelayMange = 20;
    public static int MinDelayPense; /*  5 */
    public static int MaxDelayPense; /* 20 */

    private static Simulateur simu;
    private static StrategiePhilo strategie;

    /* PhiloDroite est le numéro du philosophe à droite de no. */
    public static int PhiloGauche (int no)
    {
        if (no == nbPhilosophes - 1)
          return 0;
        else
          return no + 1;
    }

    /* PhiloGauche est le numéro du philosophe à gauche de no. */
    public static int PhiloDroite (int no)
    {
        if (no == 0)
          return nbPhilosophes - 1;
  
        return no - 1;
    }

    /* FourchetteDroite est le numéro de la fourchette de droite du philo no. */
    public static int FourchetteGauche (int no)
    {
        if (no == nbPhilosophes - 1)
          return 0;
        else
          return no + 1;
    }

    /* FourchetteGauche est le numéro de la fourchette de gauche du philo no. */
    public static int FourchetteDroite (int no)
    {
        return no;
    }

    /****************************************************************/
    /* Utilisé par IHMPhilo. */
    public static void setSleepDuration (int intensite)
    {
        switch (intensite) {
          case 0:                   /* Peu gourmands */
            MinDelayPense = 20 * MinDelayMange;
            MaxDelayPense = 20 * MaxDelayMange;
            break;
          case 1:                   /* Assez gourmands */
            MinDelayPense = 5 * MinDelayMange;
            MaxDelayPense = 5 * MaxDelayMange;
            break;
          case 2:                   /* gourmands (initial) */
            MinDelayPense = MinDelayMange;
            MaxDelayPense = MaxDelayMange;
            break;
          case 3:                   /* Très gourmands */
            MinDelayPense = (MinDelayMange + 1) / 3;
            MaxDelayPense = (MaxDelayMange + 1) / 3;
            break;
          case 4:                   /* Extrêmement gourmands */
            MinDelayPense = (MinDelayMange + 1) / 8;
            MaxDelayPense = (MaxDelayMange + 1) / 8;
            break;
          default:
            System.out.println ("Frequence de sommeil hors des bornes.");
        }
        //System.out.println ("Delai pense = "+MinDelayPense+"-"+MaxDelayPense+", utilise = "+MinDelayMange+"-"+MaxDelayMange);
    }

    static public void initialiser (String nomImplantation, int nbPhilo) {
        nbPhilosophes = nbPhilo;
        setSleepDuration (2);
        simu = new Simulateur (nbPhilosophes);
        
        strategie = charger_implantation("StrategiePhilo", nomImplantation, nbPhilosophes);
        
        new IHMPhilo (strategie.nom(), nbPhilosophes, simu);

        for (int i = 0; i < nbPhilosophes; i++) {
            Runnable philo = new ProcessusPhilosophe (i, strategie, simu);
            Thread t = new Thread(philo);
            t.start();
        }

    }

    /** Crée un objet à partir de l'implantation implName, qui doit implanter
     * l'interface interfName et dont le constructeur prendra un int en
     * argument. */
    private static StrategiePhilo charger_implantation (String interfName, String implName, int nbPhilo)
    {
        StrategiePhilo res = null;

        // Obtenir l'interface interfName
        Class<?> interf;
        try {
            interf = Class.forName (interfName);
        } catch (ClassNotFoundException e) {
            System.err.println ("Panic: ne trouve pas l'interface "+interfName+" :"+e);
            return null;
        }

        // Trouve la classe implName (ou interfName_implName)
        Class<?> implant = null;
        try {
            implant = Class.forName (implName);
        } catch (ClassNotFoundException e1) {
            try {
                implant = Class.forName (interfName+"_"+implName);
            } catch (ClassNotFoundException e2) {
                System.err.println ("Impossible de trouver la classe "+implName+": "+e1);
                return null;
            }
        }

        // Vérifie qu'elle implante la bonne interface
        if (! interf.isAssignableFrom (implant)) {
            System.err.println ("La classe "+implant.getName()+" n'implante pas l'interface "+interf.getName()+".");
            return null;
        }

        // Crée une instance
        try {
            Class[] consparam = { int.class };
            java.lang.reflect.Constructor cons = implant.getConstructor(consparam);
            Object[] initargs = { new Integer(nbPhilo) };
            res = (StrategiePhilo) cons.newInstance (initargs);
        } catch (NoSuchMethodException e) {
            System.err.println ("Classe "+implant.getName()+": pas de constructeur adequat: "+e);
        } catch (InstantiationException e) {
            System.err.println ("Echec instation "+implant.getName()+": "+e);
        } catch (IllegalAccessException e) {
            System.err.println ("Echec instation "+implant.getName()+": "+e);
        } catch (java.lang.reflect.InvocationTargetException e) {
            System.err.println ("Echec instation "+implant.getName()+": "+e);
            if (e.getCause() != null) {
                System.err.println (" La cause est : " + e.getCause()
                  + " in " + (e.getCause().getStackTrace())[0]);
            }
        } catch (ClassCastException e5) {
            System.err.println ("Echec instation "+implant.getName()+": n'est pas un "+interfName+": "+e5);
        }
        return res;
    }

    public static void main (String args[])
    {
        if ((args.length != 0) && (args.length != 2)) {
            System.out.println("java Main <implantation> <nb_philo>");
            System.exit (1);
        }
        if (args.length == 0) {
            new IHMArgs(null);
            /* no return */
        } else {
            String implantation = args[0];
            int nbPhilo = Integer.parseInt (args[1]);
            if (nbPhilo < 2) {
                System.out.println ("nb philo >= 2");
                System.exit (1);
            }
            initialiser (implantation, nbPhilo);
        }
    }
}
