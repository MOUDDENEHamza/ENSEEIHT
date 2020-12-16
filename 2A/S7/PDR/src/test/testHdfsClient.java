package test;

import formats.Format;
import hdfs.HdfsClient;
import hdfs.HdfsServer;
import hdfs.NameProvider;
import hdfs.Register;
import org.junit.Assert;
import org.junit.Test;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.rmi.NotBoundException;
import java.rmi.registry.LocateRegistry;
import java.rmi.registry.Registry;
import java.util.concurrent.ExecutionException;

class testHdfsClient {

    public void testGeneral(int nb_serveurs, String nb_fichier) throws IOException, ExecutionException, InterruptedException, NotBoundException {
        Registry[] registries = new Registry[nb_serveurs];
        HdfsServer[] serveurs = new HdfsServer[nb_serveurs];
        for (int i = 0; i < nb_serveurs; i++) {
            registries[i] = LocateRegistry.getRegistry(NameProvider.NAME_PROVIDER_PORT);
            serveurs[i] = new HdfsServer((Register) registries[i].lookup("//localhost:" + NameProvider.NAME_PROVIDER_PORT + "/ServerRegistry"), "serverData", String.valueOf(i));
            serveurs[i].start();
        } // Initialisation des serveurs

        String nom_destination = nb_fichier.replace(".txt","_read_result.txt");
        HdfsClient.HdfsWrite(Format.Type.LINE,nb_fichier,1); //java HdfsClient write line nb_fichier
        HdfsClient.HdfsRead(nb_fichier,nom_destination); //java HdfsClient read nb_fichier
        File file1 = new File(nb_fichier);
        File file2 = new File(nom_destination);
        Assert.assertTrue(file1.exists());
        Assert.assertTrue(file2.exists()); // On s'assure que le fichier généré existe
        Assert.assertEquals(file1.length(),file2.length()); //On s'assure que les deux fichiers ont la même taille
        FileInputStream fstream1 = new FileInputStream(nb_fichier);
        FileInputStream fstream2 = new FileInputStream(nom_destination);
        int i1 = fstream1.read();
        int i2 = fstream2.read();
        while (i1 != -1) {
            Assert.assertEquals(i1,i2); //On s'assure que les fichiers sont identiques, caractère pas caractère
            i1 = fstream1.read();
            i2 = fstream2.read();
        }
        fstream1.close();
        fstream2.close();
        HdfsClient.HdfsDelete(nb_fichier); //On supprimme le fichier

    }

    @Test
    public void TresPetitFichiertest() throws IOException, ExecutionException, InterruptedException, NotBoundException {
        testGeneral(1,"Kilo.txt");
        testGeneral(2,"Kilo.txt");
        testGeneral(4,"Kilo.txt");
        testGeneral(8,"Kilo.txt");
        testGeneral(16,"Kilo.txt");
    }

}