#!/bin/bash
ID=$(id -u)

if [ $ID -eq 0 ]
then
    echo "Hello root, we are proceeding"
    echo "checking if package already installed or not"
    package=$(yum list installed mysql)
    if [ $? -eq 0 ] 
    then
        echo "package already installed, so exiting"
        exit 1
    else
        echo "package not installed, so proceeding further"
    fi
    dnf install mysql -y
        if [ $? -eq 0 ]
        then
            echo "mysql installation is success"
        else
            echo "mysql installation is failed"
        fi
else
    echo "you are not root user, hence exiting from this script"
    exit 1
fi