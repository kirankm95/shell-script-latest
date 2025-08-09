#!/bin/bash
ARG1=$1
ARG2=$2
SUM=$(($ARG1+$ARG2))

echo "the sum of given two numbers is:: ${SUM}"

echo "first argument passed: ${ARG1}"
echo "second argument passed: ${ARG2}"
echo "last argument passwd: $N"
echo "all arguments passed: $@"
echo "total number of arguments passed: $#"
echo "total number of arguments passed: $*"
