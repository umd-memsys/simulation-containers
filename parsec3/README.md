# PARSEC 3.0 Benchmark Container for Architectural Simulation

## PARSEC 3.0 Benchmark

Refer http://parsec.cs.princeton.edu/ for more info on the benchmark.

## Architectural Simulation

For architectural simulation, we only need the "core" and "sim input" of
PARSEC to build a minimum sized docker image.

Build envrionment/base image: Ubuntu 14 with GCC-4.8.

# Known Issues

`kernels/dedup` will not build.
