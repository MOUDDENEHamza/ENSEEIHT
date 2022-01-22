
javac -cp ".:$SPARK_HOME/jars/apache-log4j-extras-1.2.17.jar:$SPARK_HOME/jars/spark-catalyst_2.11-2.4.3.jar:$SPARK_HOME/jars/spark-core_2.11-2.4.3.jar:$SPARK_HOME/jars/scala-library-2.11.12.jar:$SPARK_HOME/jars/scala-reflect-2.11.12.jar:$SPARK_HOME/jars/spark-mllib_2.11-2.4.3.jar:$SPARK_HOME/jars/spark-mllib-local_2.11-2.4.3.jar:$SPARK_HOME/jars/spark-sql_2.11-2.4.3.jar" *.java

jar cf ml.jar *.class
rm *.class

