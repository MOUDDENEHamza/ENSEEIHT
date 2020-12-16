package ordo;

import formats.*;
import map.MapReduce;
import hdfs.*;

import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.HashMap;

/**
 * Job class realizes the JobInterface
 *
 * @author Hamza Mouddene
 * @version 1.0
 */
public class Job implements JobInterface {

    /**
     * Attributs of Job class
     */
    private Format.Type inputFormat;    // The format of the file in input
    private String inputFileName;       // The name of HDFS file

    /**
     * Constructor of Job class
     */
    public Job() {

    }

    /**
     * Get the input file format
     *
     * @return the input file format
     */
    public Format.Type getInputFormat() {
        return inputFormat;
    }

    @Override
    public void setInputFormat(Format.Type ft) {
        this.inputFormat = ft;
    }

    /**
     * Get the input file name
     *
     * @return the input file name
     */
    public String getInputFileName() {
        return this.inputFileName;
    }

    @Override
    public void setInputFileName (String FileName) {
        this.inputFileName = FileName;
    }
    
    @Override
    public void startJob (MapReduce mr) {
        try {
            HashMap<String, Pair<ArrayList<ServerRecord>, Pair<Integer, Integer>>> fileRecord;
            fileRecord = new NameProvider().files.get(this.getInputFileName()).getChunksHash();
            int nbChunks = fileRecord.get(this.getInputFileName()).getRight().getRight();

            // Reminder called when the execution of map is done
            CallBack callBack = new CallBack(nbChunks);

            for (int i = 0; i < nbChunks; i++) {
                //worker[i % nbChunks].runMap(mr, reader, writer, callBack);
            }
        } catch (UnknownHostException e) {
            e.printStackTrace();
        }
    }
}
