#!/bin/bash

javac *.java

terminator -e 'java Server; exec bash'

for i in {1..10}; do
	java Probe
done

rm *.class
