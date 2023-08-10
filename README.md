# birthday.py
This project aims to solve the birthday problem empirically
by running a simulation many times; using a variety of
techniques to speed up the process along the way.

## Problem Description
Taken from [Wikipedia](https://en.wikipedia.org/wiki/Birthday_problem):

> In probability theory, the birthday problem asks for the probability that,
> in a set of `n` randomly chosen people, at least two will share a birthday.
> The birthday paradox refers to the counterintuitive fact that only 23
> people are needed for that probability to exceed 50%.

## Tools Used
2 different tools are used to measure the increase in performance.

1. The `parallel` command-line tool
2. The Python `numba` library

The table below displays a summary of where each tool is used.

|                  | `parallel`         | `numba`            |
|------------------|--------------------|--------------------|
| `run.sh`         | :white_check_mark: | :x:                |
| `run-slow.sh`    | :x:                | :x:                |
| `run-numba.sh`   | :white_check_mark: | :white_check_mark: |
| `run-numba-slow` | :x:                | :white_check_mark: |

## Usage
Obviously, the requirements need to be met.

1. Install GNU parallel from your distro's respective repository. The package name
is probably `parallel`

2. Run `python -m pip install -r requirements.txt` to install the necessary Python packages.
It is recommended to create your own virtual environment and activate it first.

```
python -m venv venv
source ./venv/bin/activate
```

Now simply running `benchmarks.sh` should start the testing and generate a `benchmarks.txt`
file once the tests are completed. The results will be stored there. One may optionally
provide a numeric argument to `benchmarks.sh` when running it. This argument determines
the number of times the problem is simulated and defaults to 1,000,000 if no arguments are
provided.
