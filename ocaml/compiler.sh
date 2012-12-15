#!/bin/bash

cat $1 >input.alg
./test1
cat output.c> $2
g++ -o $2 output.c
