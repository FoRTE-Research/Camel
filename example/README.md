Hand-instrumented implementation of the Cuckoo Filter benchmark.

There are three options to compile the benchmark which change Camel's behavior on function entry.

Running 'make' generates three binaries, one for each behavior.

- In camel\_cuckoo\_all.out, Camel copies the entire safe buffer into the unsafe buffer on function entry.
- In camel\_cuckoo\_reads.out, Camel copies from the safe to unsafe buffer only the variables the function reads.
- In camel\_cuckoo\_idempotent.out, Camel copies from the safe to unsafe buffer only the variables that the function reads _first_.

By default, they are generated for the MSP430FR6989. However, camel\_cuckoo.c supports the MSP430F5529 - just change the DEVICE variable in the Makefile.
