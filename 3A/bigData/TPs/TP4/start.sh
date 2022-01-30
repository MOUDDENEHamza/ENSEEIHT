
rm -rf /tmp/hadoop*
ssh verlaine.enseeiht.fr rm -rf /tmp/hadoop*
ssh melofee.enseeiht.fr rm -rf /tmp/hadoop*

hdfs namenode -format

start-dfs.sh

start-master.sh
start-slaves.sh

