
hdfs dfs -rm /output/*
hdfs dfs -rmdir /output
spark-submit --class WordCount --master spark://omble.enseeiht.fr:7077 wc.jar
