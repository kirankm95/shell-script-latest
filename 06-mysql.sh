#!/bin/bash
ID=$(id -u)

if [ $ID -eq 0 ]
then
    echo "Hello root, we are proceeding"
    dnf install mysql -y
    if [ $? -eq 0 ]
        echo "mysql installation is success"
    else
        echo "mysql installation is failed"

else
    echo "you are not root user, hence exiting from this script"
    exit 1
fi