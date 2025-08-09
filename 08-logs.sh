#!/bin/bash
ID=$(id -u)
TIME=$(date +%F-%H-%M-%S)
LOGFILE="/tmp/$0-$TIME.log"
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

echo "this script started executing at ${TIME}" &>> $LOGFILE

validate(){
    if [ $1 -eq 0 ]
    then
        echo "$2 installed $G success $N"
    else
        echo "$2 installed $R failed $N"
    fi
}
if [ $ID -ne 0 ]
then
    echo "$Y you are not root user, please re-try with root user $N"
    exit 1
else
    echo "$G you are root user, hence proceeding $N"
    dnf install mysql -y &>> $LOGFILE
    validate $? mysql
    dnf install git -y &>> $LOGFILE
    validate $? git
fi