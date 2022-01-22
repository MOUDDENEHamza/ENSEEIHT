import java.util.Arrays;

import org.apache.log4j.Level;
import org.apache.log4j.Logger;
import org.apache.spark.ml.classification.MultilayerPerceptronClassificationModel;
import org.apache.spark.ml.classification.MultilayerPerceptronClassifier;
import org.apache.spark.ml.evaluation.MulticlassClassificationEvaluator;
import org.apache.spark.ml.linalg.DenseVector;
import org.apache.spark.ml.linalg.SparseVector;
import org.apache.spark.sql.Dataset;
import org.apache.spark.sql.Row;
import org.apache.spark.sql.SparkSession;

public class TestSVMImage {
	
	public static void main(String[] args) {
		
		Logger.getLogger("org").setLevel(Level.OFF);
		Logger.getLogger("akka").setLevel(Level.OFF);
		
		SparkSession spark = SparkSession
				  .builder()
				  .appName("Mnist Neural")
				  .getOrCreate();
		
		// Load training data
		String path = "data/libsvm-mnist.txt";
		Dataset<Row> rawdata = spark.read().option("numFeatures", "784").format("libsvm").load(path);
		
		// test one image
		Row ro = rawdata.head();
		System.out.format("label: %.2f\n",ro.apply(0));
		SparseVector sv = (SparseVector)ro.apply(1);
		DenseVector dv = sv.toDense();
		int[][] image = new int[28][28];
		for (int i=0;i<28;i++) Arrays.fill(image[i], 0);
		for (int i=0; i<dv.size();i++) image[i/28][i%28] = (int)Math.round(dv.apply(i)*255);
		System.out.printf("%s", MnistReader.renderImage(image));
		 
	}
}


