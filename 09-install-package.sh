#!/bin/bash
ID=$(id -u)
TIME=$(date +%F-%H-%M-%S)
LOGFILE="/tmp/$0-$TIME.log"
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

echo -e "this script started executing at ${TIME}" &>> $LOGFILE

validate(){
    if [ $1 -eq 0 ]
    then
        echo -e "$2 installed $G success $N"
    else
        echo -e "$2 installed $R failed $N"
    fi
}

if [ $ID -ne 0 ]
    then
        echo -e "$Y you are not root user, please re-try with root user $N"
        exit 1
    else
        echo -e "$G you are root user, hence proceeding $N"
fi
        

for package in $@
do
    dnf list installed $package
    if [ $? -eq 0 ]
    then
        echo -e "$Y mentioned $package already installed $N"
    else
        dnf install $package -y
        validate $? $package
    fi
done