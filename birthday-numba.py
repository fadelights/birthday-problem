"""
The birthday problem states that for every 23 people in a room,
there will be a 50% chance that two of them were born on the
same day of the year. Lets test it!
This time, using Numba for a little bit of added speed.
"""
import sys
from random import randint
import numpy as np
from numba import njit, prange


@njit
def gen_bdays(n: int=23, start: int=1, end: int=365) -> list[int]:
    """Generate 23 random numbers (days) within the range of 1-365"""
    bdays = []
    for i in prange(n):
        bdays.append(randint(start, end))

    return bdays


@njit
def has_dups(l: list) -> bool:
    """Check for duplicates within a list"""
    for num in l:
        if l.count(num) > 1:
            return True

    return False


@njit(parallel=True)
def main(n=1_000_000):
    """Run the code `n` times and report the result"""
    results = np.zeros(n)
    for i in prange(n):
        bdays = gen_bdays()
        results[i] = has_dups(bdays)

    print(np.mean(results))


if __name__ == "__main__":
    if len(sys.argv) > 1 and sys.argv[1] != "":
        main(int(sys.argv[1]))
    else:
        main()
