import java.util.Collection;

import org.apache.spark.SparkConf;
import org.apache.spark.api.java.JavaPairRDD;
import org.apache.spark.api.java.JavaRDD;
import org.apache.spark.api.java.JavaSparkContext;

import scala.Tuple2;

public class MonthCount {
	
	public static void main(String[] args) { 
	    String inputFile = "meteosample.txt"; 
	    String outputFile = "result"; 

	    SparkConf conf = new SparkConf().setAppName("MonthCount"); 
	     JavaSparkContext sc = new JavaSparkContext(conf); 
	    
	    long t1 = System.currentTimeMillis(); 

	    JavaRDD<String> data = sc.textFile(inputFile); 
	    
	    JavaPairRDD<String, Integer> counts = 
			data.mapToPair(l ->
				new Tuple2<String, Integer>(
					l.split(" : ")[1],
					Integer.parseInt(l.split(" : ")[3])
				)
			)
			.filter(t -> t._2 > 20);
			
	    JavaPairRDD<String, Integer> res = counts.groupByKey().mapValues(t -> ((Collection<?>)t).size());
	    
	    res.saveAsTextFile(outputFile); 
	    
	    long t2 = System.currentTimeMillis(); 
	    
	    System.out.println("======================"); 
	    System.out.println("time in ms :"+(t2-t1)); 
	    System.out.println("======================"); 

	} 

}
