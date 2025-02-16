#!/usr/bin/sh

# Runs the Birthday Problem simulation
#   parallelized using `parallel` 🗸
#   jit compiled using numba ⨯

cores=$(nproc --all)
arg=$(($1 / cores))

seq 1 $cores | parallel -j $cores python3 birthday.py "$arg" | xargs python3 mean.py
