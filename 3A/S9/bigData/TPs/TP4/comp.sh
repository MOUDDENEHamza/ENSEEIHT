
javac -cp ".:$HADOOP_HOME/share/hadoop/common/hadoop-common-2.7.1.jar:$HADOOP_HOME/share/hadoop/mapreduce/hadoop-mapreduce-client-common-2.7.1.jar:$HADOOP_HOME/share/hadoop/mapreduce/hadoop-mapreduce-client-core-2.7.1.jar:$SPARK_HOME/jars/spark-core_2.11-2.4.3.jar:$SPARK_HOME/jars/scala-library-2.11.12.jar:$SPARK_HOME/jars/hadoop-common-2.7.3.jar" WordCount.java

jar cf wc.jar *.class
rm *.class

