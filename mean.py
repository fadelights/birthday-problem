from statistics import mean
import sys


def strtonum(l: list[str]) -> list[float]:
    """Receives a list of strings and returns them as
    a list of numbers."""
    l_ints = [float(num) for num in l]
    return l_ints


if __name__ == "__main__":
    args = strtonum(sys.argv[1:])
    result = mean(args)
    result = round(result, 4)
    print(result)
