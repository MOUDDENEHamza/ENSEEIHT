source utils.sh
N=${1:-4}
room=${2:-214}
TOOLSDIR=/mnt/n7fs/ens/tp_guivarch/hpc2021
MPEDIR=$TOOLSDIR/mpe2-2.4.9b
MPIDIR=$TOOLSDIR/openmpi-2.1.1/build/bin
mpirun=$MPIDIR/mpirun
hosts=hostfiles/hostfile_$room
if [ ! -f $hosts ]; then
    echo "$hosts file does not exist, $room is not a valid room."
    exit
fi
hostfile=hostfiles/"$room"_$N

echo selecting $((N-1)) machines in $hosts + $HOSTNAME
cat $hosts | sed '/^#/d' | grep enseeiht | sed "/$HOSTNAME/d" | shuf -n $((N - 1)) > $hostfile
echo $HOSTNAME slots=4 max-slots=4 >> $hostfile

echo machines selected can be found in ./$hostfile
cat $hostfile

if [ ! -f ~/.ssh/id_rsa_progpar ]; then
  ssh-keygen -t rsa -f ~/.ssh/id_rsa_progpar
  #cat ~/.ssh/id_rsa_progpar >> ~/.ssh/authorized_keys
  echo "IdentityFile ~/.ssh/id_rsa_progpar" > ~/.ssh/config
fi
echo "$HOSTNAME $USER" >> $HOME/.rhosts
echo we try and connect to the machine for mpirun to work properly
count=0
while read line; do
  host=$( echo $line | grep -o '.*.enseeiht.fr' )
  name=$(echo $host | sed 's/.enseeiht.fr//g')
  echo adding $host and $name
  ssh-copy-id -f -i ~/.ssh/id_rsa_progpar.pub $host &> /dev/null
#  ssh-copy-id -f -i ~/.ssh/id_rsa_progpar.pub $name &> /dev/null
#  ssh -n -o BatchMode=yes $host 'mpirun --version'
#  ssh -n -o BatchMode=yes $host 'mpicc --showme:version'
#  ssh -n -o BatchMode=yes $host 'mpifort --showme:version'
  ssh -n -o BatchMode=yes $host "$MPIDIR/mpicc --showme:version"
#  ssh -n -o BatchMode=yes $host "$MPIDIR/mpifort --showme:version"
  count=`expr $count + 1`
  echo
done < <(head -1 $hostfile)

while read line; do
  host=$( echo $line | grep -o '.*.enseeiht.fr' )
  name=$(echo $host | sed 's/.enseeiht.fr//g')
  echo adding $host and $name
  ssh -n $name "$MPIDIR/mpicc --showme:version"
  count=`expr $count + 1`
  echo
done < <(cat $hostfile)

while [ $count -gt 0 ]; do
  wait $pids
  count=`expr $count - 1`
done
