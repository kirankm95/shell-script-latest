#!/bin/bash

ID=$(id -u)

if [ $ID -ne 0 ]
then
    echo "you are not root user, please re-try with root user"
else
    echo "you are root user, hence proceeding"
    dnf install mysql
    if [ $? -eq 0 ]
    then
        echo "package mysql installed success"
    else
        echo "package mysql installed failed"
    fi
    dnf install git
    if [ $? -eq 0 ]
    then
        echo "package git installed success"
    else
        echo "package git installed failed"
    fi
fi
