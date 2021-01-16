#!/bin/bash

javac *.java
terminator -e 'java Comanche 8081'
terminator -e 'java Comanche 8082'
