#!/usr/bin/sh

if [ "$#" -eq 0 ]
then
    N=1000000
elif [ "$#" -gt 1 ]
then
    echo "Too many arguments (〃＞＿＜;〃)" >&2
    exit 1
elif [ "$#" -eq 1 ] && ! $(echo "$1" | grep -Eq '^[0-9]+$')
then
    echo "Passed argument needs to be AN INTEGER (凸ಠ益ಠ)凸" >&2
    exit 1
else
    N="$1"
fi

/usr/bin/time --verbose -o benchmarks.txt ./run-slow.sh "$N"
echo "\t--------------" >> benchmarks.txt

/usr/bin/time --verbose -a -o benchmarks.txt ./run.sh "$N"
echo "\t--------------" >> benchmarks.txt

/usr/bin/time --verbose -a -o benchmarks.txt ./run-numba-slow.sh "$N"
echo "\t--------------" >> benchmarks.txt

/usr/bin/time --verbose -a -o benchmarks.txt ./run-numba.sh "$N"
echo "\t--------------" >> benchmarks.txt
