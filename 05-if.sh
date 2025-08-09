#!/bin/bash
i=$1

if [ $i -gt 100 ]
then
    echo "$i is greater than 100"
else
    echo "$i is less than 100"
fi