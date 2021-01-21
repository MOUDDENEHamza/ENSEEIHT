#!/bin/bash

javac *.java

terminator -e 'java Server; exec bash'

sleep 2

java Client 10
java Client 90
java Client 100
