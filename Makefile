all: clean package out test

package:
	mvn package

test:
	java -jar target/owl-api-big-1.0-SNAPSHOT-jar-with-dependencies.jar 5 > out/test.owl

clean:
	mvn clean
	- rm -r out

out:
	- mkdir out

small:	o10.owx o100.owx o1000.owx o10000.owx o100000.owx o1000000.owx

large:	o10.owx o100.owx o1000.owx o10000.owx o100000.owx o1000000.owx o2500000.owx o5000000.owx o10000000.owx o20000000.owx

o10.owx:
	java -jar target/owl-api-big-1.0-SNAPSHOT-jar-with-dependencies.jar 10 > out/o10.owx

o100.owx:
	java -jar target/owl-api-big-1.0-SNAPSHOT-jar-with-dependencies.jar 100 > out/o100.owx

o1000.owx:
	java -jar target/owl-api-big-1.0-SNAPSHOT-jar-with-dependencies.jar 1000 > out/o1000.owx

o10000.owx:
	java -jar target/owl-api-big-1.0-SNAPSHOT-jar-with-dependencies.jar 10000 > out/o10000.owx

o100000.owx:
	java -jar target/owl-api-big-1.0-SNAPSHOT-jar-with-dependencies.jar 100000 > out/o100000.owx

o1000000.owx:
	java -jar target/owl-api-big-1.0-SNAPSHOT-jar-with-dependencies.jar 1000000 > out/o100000.owx

o2500000.owx:
	java -jar target/owl-api-big-1.0-SNAPSHOT-jar-with-dependencies.jar 2500000 > out/o250000.owx

o5000000.owx:
	java -jar target/owl-api-big-1.0-SNAPSHOT-jar-with-dependencies.jar 5000000 > out/o500000.owx

o10000000.owx:
	java -jar target/owl-api-big-1.0-SNAPSHOT-jar-with-dependencies.jar 10000000 > out/o1000000.owx

## This file comes in at over 1Gb which seems a nice round number to
## stop at.
o20000000.owx:
	java -jar target/owl-api-big-1.0-SNAPSHOT-jar-with-dependencies.jar out/20000000 > o2000000.owx

