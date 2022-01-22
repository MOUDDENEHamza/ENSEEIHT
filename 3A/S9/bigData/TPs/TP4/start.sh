
rm -rf /tmp/hadoop*
ssh slave1 rm -rf /tmp/hadoop*
ssh slave2 rm -rf /tmp/hadoop*

hdfs namenode -format

start-dfs.sh

start-master.sh
start-slaves.sh

