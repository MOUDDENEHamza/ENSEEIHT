// Time-stamp: <08 Apr 2008 11:35 queinnec@enseeiht.fr>

import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;
import Synchro.Assert;

/** Lecteurs/rédacteurs
 * stratégie d'ordonnancement: priorité aux rédacteurs,
 * implantation: avec un moniteur. */
public class Test implements LectRed
{

    private Lock moniteur = new ReentrantLock();
    private Condition acces;
    private Condition sas;
    private boolean ecriture;
    private boolean ecritureSas;
    private int nbRedacteursAttente;
    private int nbLecteurs;

    public Test() {
        acces = moniteur.newCondition();
        sas = moniteur.newCondition();
    }

    public void demanderLecture() throws InterruptedException {
        moniteur.lock();
        while (ecriture || ecritureSas) {
            acces.await();
        }
        nbLecteurs++;
        acces.signal();
        moniteur.unlock();
    }

    public void terminerLecture() throws InterruptedException {
        moniteur.lock();
        nbLecteurs--;
        if (nbLecteurs == 0) {
            sas.signal();
        }
        moniteur.unlock();
    }

    public void demanderEcriture() throws InterruptedException {
        moniteur.lock();
        if (ecriture || nbLecteurs > 0) {
            nbRedacteursAttente++;
            acces.await();
            nbRedacteursAttente--;
        }
        while (nbLecteurs > 0) {
            ecritureSas = true;
            sas.await();
            ecritureSas = false;
        }
        ecriture = true;
        moniteur.unlock();
    }

    public void terminerEcriture() throws InterruptedException {
        moniteur.lock();
        ecriture = false;
        if (ecritureSas) {
            sas.signal();
        } else {
            acces.signal();
        }
        moniteur.unlock();
    }

    public String nomStrategie() {
        return "Stratégie: test.";
    }
}