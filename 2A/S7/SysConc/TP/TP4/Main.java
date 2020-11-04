// Time-stamp: <02 mai 2013 10:22 queinnec@enseeiht.fr>
// v1 (10/14, PM) : Nettoyage applet

import Synchro.Simulateur;

public class Main
{
    static final boolean verbose = false;

    static private LectRed lr;
    static private int nblecteurs;
    static private int nbredacteurs;

    /* Chaque lecteur lit entre MinDelayLit et MaxDelayLit secondes, et
     * pense entre MinDelayLRien et MaxDelayLRien (les deux bornes incluses). */
    /* Chaque rédacteur écrit entre MinDelayEcrit et MaxDelayEcrit secondes, et
     * pense entre MinDelayERien et MaxDelayERien (les deux bornes incluses). */
    static int MinDelayLRien;
    static int MaxDelayLRien;
    static int MinDelayERien;
    static int MaxDelayERien;
    static final int MinDelayLit = 5;
    static final int MaxDelayLit = 20;
    static final int MinDelayEcrit = 2;
    static final int MaxDelayEcrit = 10;

    /* L'intervalle de sommeil est tjs calculé par rapport à l'intervalle
     * d'utilisation. */
    static void setSleepDuration (int freql, int freqr)
    {
        switch (freql) {
          case 0:                   /* Peu gourmands */
            MinDelayLRien = 20 * MinDelayLit;
            MaxDelayLRien = 20 * MaxDelayLit;
            break;
          case 1:                   /* Assez gourmands */
            MinDelayLRien = 5 * MinDelayLit;
            MaxDelayLRien = 5 * MaxDelayLit;
            break;
          case 2:                   /* gourmands (initial) */
            MinDelayLRien = MinDelayLit;
            MaxDelayLRien = MaxDelayLit;
            break;
          case 3:                   /* Très gourmands */
            MinDelayLRien = (MinDelayLit + 1) / 3;
            MaxDelayLRien = (MaxDelayLit + 1) / 3;
            break;
          case 4:                   /* Extrêmement gourmands */
            MinDelayLRien = (MinDelayLit + 1) / 8;
            MaxDelayLRien = (MaxDelayLit + 1) / 8;
            break;
          default:
            if (verbose)
              System.out.println ("Frequence de sommeil hors des bornes.\n");
        }
        if (verbose)
          System.out.println ("Lecteur: Delai pense ="+ MinDelayLRien +"-"+MaxDelayLRien+", utilise = "+ MinDelayLit+"-"+MaxDelayLit);
        switch (freqr) {
          case 0:                   /* Peu gourmands */
            MinDelayERien = 20 * MinDelayEcrit;
            MaxDelayERien = 20 * MaxDelayEcrit;
            break;
          case 1:                   /* Assez gourmands */
            MinDelayERien = 5 * MinDelayEcrit;
            MaxDelayERien = 5 * MaxDelayEcrit;
            break;
          case 2:                   /* gourmands (initial) */
            MinDelayERien = MinDelayEcrit;
            MaxDelayERien = MaxDelayEcrit;
            break;
          case 3:                   /* Très gourmands */
            MinDelayERien = (MinDelayEcrit + 1) / 3;
            MaxDelayERien = (MaxDelayEcrit + 1) / 3;
            break;
          case 4:                   /* Extrêmement gourmands */
            MinDelayERien = (MinDelayEcrit + 1) / 8;
            MaxDelayERien = (MaxDelayEcrit + 1) / 8;
            break;
          default:
            if (verbose)
              System.out.println ("Frequence de sommeil hors des bornes.");
        }
        if (verbose)
          System.out.println ("Redacteur: Delai pense ="+ MinDelayERien +"-"+MaxDelayERien+", utilise = "+ MinDelayEcrit+"-"+MaxDelayEcrit);

    }

    static public void initialiser (String nomImplantation, int _nblecteurs, int _nbredacteurs) {

        lr = charger_implantation ("LectRed", nomImplantation);
        if (lr == null) {
            System.err.println ("Abandon.");
            System.exit (1);
        }

        nblecteurs = _nblecteurs;
        nbredacteurs = _nbredacteurs;

        ThreadGroup thg = new ThreadGroup ("L/R");

        if (verbose)
          System.out.println(lr.nomStrategie()+" - Lecteurs: "+nblecteurs+" - Redacteurs: "+nbredacteurs);

        Simulateur simu = new Simulateur (thg);

        setSleepDuration (2, 2);
        IHMLectRed ihm = new IHMLectRed (lr, simu);
        
        simu.start();
        
        for (int i = 0; i < nblecteurs; i++) {
            new ProcessusLecteur(lr,simu,ihm).start();
        }
        for (int i = 0; i < nbredacteurs; i++) {
            new ProcessusRedacteur(lr,simu,ihm).start();
        }
        ihm.computePlacement();
     
    }

    /** Crée un objet à partir de l'implantation implName, qui doit implanter
     * l'interface interfName. */
    private static LectRed charger_implantation (String interfName, String implName)
    {
        LectRed res = null;

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
            Class[] consparam = { };
            java.lang.reflect.Constructor cons = implant.getConstructor (consparam);
            Object[] initargs = { };
            res = (LectRed) cons.newInstance (initargs);
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

    public static void main (String args [])
    {
        int nbArgs = args.length;

        if ((nbArgs != 0) && (nbArgs != 3)) {
            System.out.println("java Main <implantation> <nb_lect> <nb_red>");
            System.exit (1);
        }
        if (nbArgs == 0) {
            new IHMArgs (null);
            /* NO RETURN */
        } else {
            String implantation = args[0];

            int nbLecteurs = Integer.parseInt (args[1]);
            if (nbLecteurs < 1) {
                System.out.println("Nb lecteur >= 1");
                System.exit (1);
            }
            int nbRedacteurs = Integer.parseInt (args[2]);
            if (nbRedacteurs < 1) {
                System.out.println("Nb redacteur >= 1");
                System.exit (1);
            }

            initialiser (implantation, nbLecteurs, nbRedacteurs);
        }
    }
}

