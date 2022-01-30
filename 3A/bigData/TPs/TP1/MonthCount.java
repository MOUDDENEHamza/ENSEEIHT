import java.io.IOException;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.mapreduce.Reducer;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;

public class MonthCount {
	
public static class TokenizerMapper extends Mapper<Object, Text, Text, IntWritable>{ 
		
		private Text month = new Text();
		private final static IntWritable temperature = new IntWritable(); 
		
		public void map(Object key, Text value, Context context) throws IOException, InterruptedException { 
  			String[] lines = value.toString().split("\n");
  			for (String line : lines) {
  				String[] res = line.toString().split(" : ");
				month.set(res[1]);
				temperature.set(Integer.parseInt(res[3]));
  				context.write(month, temperature);
  			}
		} 
	}
	
	public static class IntSumReducer extends Reducer<Text,IntWritable,Text,IntWritable> { 
		private IntWritable result = new IntWritable(); 

		public void reduce(Text key, Iterable<IntWritable> values, Context context) throws IOException, InterruptedException { 
  			int count = 0;
  			
  			for (IntWritable val : values) { 
  					//System.out.println("key : " + key.toString() + " val " + val.get() + " ==> " + (val.get() > 20));
  					//System.out.println("count before : " + count);
    				if (val.get() > 20) {
    					count += 1;
    				} 
    				//System.out.println("count after : " + count);
  			} 
  			result.set(count); 
  			context.write(key, result); 
		} 
	} 
	
	public static void main(String[] args) throws Exception { 
		Configuration conf = new Configuration(); 
		Job job = Job.getInstance(conf, "MonthCount"); 
		job.setJarByClass(MonthCount.class); 
		job.setMapperClass(TokenizerMapper.class); 
		//job.setCombinerClass(IntSumReducer.class); 
		job.setReducerClass(IntSumReducer.class); 
		job.setOutputKeyClass(Text.class); 
		job.setOutputValueClass(IntWritable.class); 
		FileInputFormat.addInputPath(job, new Path(args[0])); 
		FileOutputFormat.setOutputPath(job, new Path(args[1])); 
		long t1 = System.currentTimeMillis(); 
		int res = job.waitForCompletion(true) ? 0 : 1; 
		long t2 = System.currentTimeMillis(); 
		System.out.println("time in ms ="+(t2-t1)); 
		System.exit(res); 
	} 

}
