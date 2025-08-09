#!/bin/bash

ID=$(id -u)

validate(){
    if [ $? -eq 0 ]
    then
        echo "package installed success"
    else
        echo "package installed failed"
    fi
}
if [ $ID -ne 0 ]
then
    echo "you are not root user, please re-try with root user"
else
    echo "you are root user, hence proceeding"
    dnf install mysqll
    validate
    dnf install git
    validate
fi
