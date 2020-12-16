package ordo;

import map.MapReduce;
import formats.Format;

/**
 * Launch a parallel process
 *
 * @author Hamza Mouddene
 * @version 1.0
 */
public interface JobInterface {

    /**
     * Set the input format
     *
     * @param ft define the format of the file in input
     */
    void setInputFormat(Format.Type ft);

    /**
     * Set the name of HDFS file containing data to process
     *
     * @param FileName is the name of HDFS file
     */
    void setInputFileName(String FileName);

    /**
     * Launch maps and workers on machines
     *
     * @param mr corresponding to MapReduce to run in parallel
     */
    void startJob(MapReduce mr);

}