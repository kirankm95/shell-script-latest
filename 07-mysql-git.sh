#!/bin/bash

ID=${id -u}

if [ $ID -ne 0 ]
then
    echo "you are not root user, please re-try with root user"
else
    echo "you are root user, hence proceeding"
    dnf istall mysql
    if [ $? -eq 0 ]
    then
        echo "package installed success"
    else
        echo "package installed failed"
    fi
fi
