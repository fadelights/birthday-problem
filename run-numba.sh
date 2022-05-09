#!/usr/bin/sh

# Runs the Birthday Problem simulation
#   parallelized using `parallel` 🗸
#   jit compiled using numba 🗸

seq 1 12 | parallel -j $(nproc --all) python3 birthday-numba.py "$1" | xargs python3 mean.py
