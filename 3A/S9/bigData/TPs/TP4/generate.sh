cp $1 /tmp/data.txt

# generate 2^$2 times file $1
for ((n=0;n<$2;n++))
do
cat /tmp/data.txt /tmp/data.txt > /tmp/temp
mv /tmp/temp /tmp/data.txt
done

