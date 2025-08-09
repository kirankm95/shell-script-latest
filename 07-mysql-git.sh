#!/bin/bash

ID=$(id -u)

validate(){
    if [ $1 -eq 0 ]
    then
        echo "$2 installed success"
    else
        echo "$2 installed failed"
    fi
}
if [ $ID -ne 0 ]
then
    echo "you are not root user, please re-try with root user"
    exit 1
else
    echo "you are root user, hence proceeding"
    dnf install mysql
    validate $? mysql
    dnf install git
    validate $? git
fi
