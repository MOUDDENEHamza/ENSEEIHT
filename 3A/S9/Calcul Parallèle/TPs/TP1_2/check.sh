source utils.sh
echo CHECKING THE METHODS LOCALLY

options="-c -v"
mpi_options="--oversubscribe --mca btl_base_warn_component_unused 0"
p=2
q=2
P=$((p*q))
b=10
n=$((4*b))
la=0
iter=1

traces="check_traces"
out="check_outputs"
csv="check.csv"
echo m,n,k,b,p,q,algo,lookahead,gflops > $csv

human=1
for algo in p2p bcast
do
  	run $human
done
for la in $(seq 1 $((n/b)))
do 
	algo="p2p-i-la"
	options="-c -l $la"
  	run $human
done
