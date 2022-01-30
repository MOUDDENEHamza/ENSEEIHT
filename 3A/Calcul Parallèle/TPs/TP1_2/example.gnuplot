set datafile separator ','
set key autotitle columnhead

set ylabel "Gflop/s"
set xlabel 'm (=n=k)'

set style line 100 lt 1 lc rgb "grey" lw 0.5 # linestyle for the grid
set grid ls 100
set ytics 10
set ytics nomirror
set xtics 256
do for [i=0:200:10] { set y2tics add (sprintf("%5.1f",i/40.0) i) }

# m,n,k,b,p,q,algo,lookahead,gflops
# 1 2 3 4 5 6 7    8         9

plot filename using 1:(stringcolumn(7) eq "p2p"?$9:NaN) with points title "p2p" lc rgb "red"  ,\
  "" using 1:(stringcolumn(7) eq "bcast"?$9:NaN)     with points title "bcast"    lc rgb "green" ,\
  "" using 1:(stringcolumn(7) eq "p2p-i"?$9:NaN)     with points title "p2p-i"    lc rgb "blue"  ,\
  "" using 1:(stringcolumn(7) eq "p2p-i-la"?$9:NaN)  with points title "p2p-i-la" lc rgb "black"
pause -1
