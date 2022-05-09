#!/usr/bin/sh

# Runs the Birthday Problem simulation
#   parallelized using `parallel` 🗸
#   jit compiled using numba ⨯

seq 1 16 | parallel -j $(nproc --all) python3 birthday.py "$1" | xargs python3 mean.py
