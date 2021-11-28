
to set your PATH variables in the N7 lab rooms
-------
export PATH=/mnt/n7fs/ens/tp_dh/eclipse:$PATH
export JAVA_HOME=/mnt/n7fs/ens/tp_dh/jdk1.8.0_45
export PATH=$JAVA_HOME/bin:$PATH

export HADOOP_HOME=<where you installed hadoop>
export PATH=$HADOOP_HOME/bin:$HADOOP_HOME/sbin:$PATH


to generate a jar from your (hadoop) eclipse project with package foo
-------
jar cf wc.jar -C eclipse-workspace/hadoop/bin/foo


to run your hadoop application (WordCount class with filesample.txt)
-------
rm -rf /tmp/hadoop-*
hdfs namenode -format
start-dfs.sh
jps
hdfs dfs -mkdir /in
hdfs dfs -put filesample.txt /in
hadoop jar wc.jar foo.WordCount /in /out



