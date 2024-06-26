all: clean package out test

clean:
	mvn clean
	- rm -r out

package:
	mvn package

out:
	- mkdir out

small:	o10.owx o100.owx o1000.owx o10000.owx o100000.owx

large:	o1000000.owx o2500000.owx o5000000.owx o10000000.owx o20000000.owx

CMD=java -jar target/owl-api-big-1.0-SNAPSHOT-jar-with-dependencies.jar

test: out
	$(CMD) 5 > out/test.owl

o10.owx:
	$(CMD) 10 > out/o10.owx

o100.owx:
	$(CMD) 100 > out/o100.owx

o1000.owx:
	$(CMD) 1000 > out/o1000.owx

o10000.owx:
	$(CMD) 10000 > out/o10000.owx

o100000.owx:
	$(CMD) 100000 > out/o100000.owx

o1000000.owx:
	$(CMD) 1000000 > out/o100000.owx

o2500000.owx:
	$(CMD) 2500000 > out/o250000.owx

o5000000.owx:
	$(CMD) 5000000 > out/o500000.owx

o10000000.owx:
	$(CMD) 10000000 > out/o1000000.owx

## This file comes in at over 1Gb which seems a nice round number to
## stop at.
o20000000.owx:
	$(CMD) 20000000 > out/o2000000.owx
