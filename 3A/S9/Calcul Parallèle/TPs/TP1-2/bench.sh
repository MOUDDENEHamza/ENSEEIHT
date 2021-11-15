source utils.sh
echo BENCHMARKING THE METHODS
p=4
q=4
P=$((p*q))
add_machines $P # create the file hostfiles/$room
echo $mpirun --verbose -N 1 --hostfile $hostfile hostname
$mpirun --verbose -N 1 --hostfile $hostfile hostname 
export OMP_NUM_THREADS=1
export MKL_NUM_THREADS=1

# proper benchmark <--- this could be a TODO for students ? (as in, show weak scaling and/or strong scaling)
#mpi_options="-N 1 --hostfile $hostfile -mca orte_tmpdir_base $OMPI_TMPDIR -mca btl_base_warn_component_unused 0" # -v"
mpi_options="-N 1 --hostfile $hostfile -mca btl_base_warn_component_unused 0" # -v"
b=256
iter=5
traces="bench_traces"
out="bench_outputs"
csv="bench.csv"
echo m,n,k,b,p,q,algo,lookahead,gflops > $csv
for i in 4 8 12
do
  n=$((i*b))
  la=0
  options="-c"
  for algo in p2p bcast
  do
    	run
  done
  for la in $(seq 1 $((n/b)))
  do 
  	algo="p2p-i-la"
  	options="-c -l $la"
    	run
  done
done
