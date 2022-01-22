

jars to include in eclipse
--------------------------
apache-log4j-extras
scala-library
scala-reflect
spark-catalyst
spark-core
spark-mllib
spark-mllib-local
spark-sql

generate the jar
----------------
jar cf ml.jar -C sparkml/bin .

generate the libsvm data file
-----------------------------
java -cp ml.jar MnistGenerateFile

test the generated libsvm data file
-----------------------------------
spark-submit --class TestSVMImage --master local ml.jar

train neural network and test
-----------------------------
spark-submit --class Neural --master local ml.jar
