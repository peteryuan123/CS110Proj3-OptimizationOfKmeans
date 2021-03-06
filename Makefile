#
# Feel free to modify and polish the Makefile if you wish.
#
# Also, you may (and should) add more compiler flags when introducing some
#   optimization techniques. BUT, it is not allowed to turn off `-W*` error
#   flags. Be strict on warnings is a good habit.
#
# Jose @ ShanghaiTech University
#

CC=g++
CFLAGS=-Wpedantic -Wall -Wextra -Werror -O2 -fopenmp -std=c++11 -march=native -frename-registers

all: kmeans

rem:
	rm result.txt
run: 
	./kmeans data.txt result.txt

kmeans: kmeans.cpp kmeans.h
	${CC} ${CFLAGS} kmeans.cpp -o kmeans

.PHONY: clean gen plot

clean:
	rm -f kmeans

gen: generate.py
	python3 generate.py data.txt

plot: plot.py
	python3 plot.py result.txt
