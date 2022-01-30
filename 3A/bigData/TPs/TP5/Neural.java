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

public class Neural {
	
	static void init() {
		MnistGenerateFile.loadFiles();
	}
	static SparseVector getSVImage(int n) {
		int image[][] = MnistGenerateFile.getImage(n);	
		double vec[] = new double[MnistGenerateFile.rsize*MnistGenerateFile.csize];
		for (int r=0;r<MnistGenerateFile.rsize;r++)
				for (int c=0;c<MnistGenerateFile.csize;c++)
					vec[r*MnistGenerateFile.csize+c] = (double)image[r][c];
		DenseVector dv = new DenseVector(vec);
		SparseVector sv = dv.toSparse();
		return sv;
	}
	static void testPred(MultilayerPerceptronClassificationModel model, int n) {
		int label = MnistGenerateFile.getLabel(n);
		SparseVector sv = getSVImage(n);
		double pred = model.predict(sv);
		System.out.format("Test a prediction (image %d): label is %d and prediction is %d\n", n, label,(int)pred);
	}
	
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
		
		// Split the data into train and test
		Dataset<Row>[] splits = rawdata.randomSplit(new double[]{0.9, 0.1}, 1234L);
		Dataset<Row> train = splits[0];
		Dataset<Row> test = splits[1];
		
		// specify layers for the neural network:
		// input layer of size 4 (features), two intermediate of size 5 and 4
		// and output of size 3 (classes)
		int[] layers = new int[] {784, 128, 64, 10};
		
		// create the trainer and set its parameters
		MultilayerPerceptronClassifier trainer = new MultilayerPerceptronClassifier()
		  .setLayers(layers)
		  .setBlockSize(128)
		  .setSeed(1234L)
		  .setMaxIter(100);

	    long t1 = System.currentTimeMillis(); 

		// train the model
		MultilayerPerceptronClassificationModel model = trainer.fit(train);

		long t2 = System.currentTimeMillis(); 
	    
	    System.out.println("======================"); 
	    System.out.println("time in ms :"+(t2-t1)); 
	    System.out.println("======================"); 
	    
		// compute accuracy on the test set
		Dataset<Row> result = model.transform(test);
		Dataset<Row> predictionAndLabels = result.select("prediction", "label");
		MulticlassClassificationEvaluator evaluator = new MulticlassClassificationEvaluator()
		  .setMetricName("accuracy");

		System.out.println("Test set accuracy = " + evaluator.evaluate(predictionAndLabels));
	
		init();
		testPred(model, 9965);
		testPred(model, 9533);
		testPred(model, 9020);
		testPred(model, 9044);
		testPred(model, 9567);
		testPred(model, 9789);		
		
	}
}


