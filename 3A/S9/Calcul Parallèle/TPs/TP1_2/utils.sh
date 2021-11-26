TOOLSDIR=/mnt/n7fs/ens/tp_guivarch/hpc2021
mpirun=$TOOLSDIR/openmpi-2.1.1/build/bin/mpirun #mpirun
alias mpirun="$mpirun -mca btl_base_warn_component_unused 0 -mca orte_base_help_aggregate 0"
MPEDIR=$TOOLSDIR/mpe2-2.4.9b
exec=build/bin/main
export MKL_NUM_THREADS=1
export NUMEXPR_NUM_THREADS=1
export OMP_NUM_THREADS=1
traces="traces"
out="outputs"
regex='([0-9]+) Gflop/s'
room=$(grep $(hostname | sed "s/.enseeiht.fr//g") hostfiles/hostfile_* -l | sed "s/hostfiles\/hostfile_//g")
add_machines() {
       N=${1:-4}
       hostfile=hostfiles/"$room"_"$N"
       if [ ! -f $hostfile ]; then
           echo Adding $N machines from C$room
           source add_ssh.sh $N $room
       fi
       echo My hostfile is $hostfile
}
run() {
        human=${1:-0}
	mkdir -p $out
 	echo $mpirun -n $P $mpi_options $exec $options -n $n -b $b -a $algo -p $p -q $q -i $iter
 	$mpirun -n $P $mpi_options $exec $options -n $n -b $b -a $algo -p $p -q $q -i $iter &> $out/$algo.out
	echo reading $out/$algo.out
	correct=$(grep -i "gemm is correct" "$out/$algo.out" | wc -l)
	trial=$(grep "Gflop/s" $out/$algo.out | grep $algo | wc -l)
	echo Found $correct correct GEMM execution out of $trial
        while read line ; do
	  # [0] (p2p) measured_wtime = 0.000058s (la=0) | 0.002195 Gflop/s
	  gflops=$( echo $line | grep -o "| .* Gflop/s" | grep -o "[0-9]\\+.[0-9]\\+" )
	  if [ $human -eq 0 ]; then
	    echo "$n,$n,$n,$b,$p,$q,$algo,$la,$gflops"
	  else
	    echo "m=n=k=$n,b=$b,p x q = $p x $q | using $algo, (lookahead:$la) => $gflops Gflop/s"
	  fi
	  echo "$n,$n,$n,$b,$p,$q,$algo,$la,$gflops" >> $csv
	done < <(grep "Gflop/s" $out/$algo.out | grep $algo)
	if [ $la -gt 0 ]; then
	  	algo=$algo-$la
	fi
	mkdir -p $traces
	mv Unknown.clog2 $traces/$algo.clog2 && 
	$MPEDIR/build/bin/clog2TOslog2 $traces/$algo.clog2 &> /dev/null &&
	rm $traces/$algo.clog2 &&
	echo You can open $traces/$algo.slog2 with $MPEDIR/build/bin/jumpshot
	echo
}
