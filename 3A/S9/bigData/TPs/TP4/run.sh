
hdfs dfs -rm /output/*
hdfs dfs -rmdir /output
spark-submit --class WordCount --master spark://master:7077 wc.jar
