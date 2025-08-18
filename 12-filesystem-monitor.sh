#!/bin/bash
ID=$(id -u)
TIME=$(date +%F-%H-%M-%S)
LOGFILE="/tmp/$0-$TIME.log"
USAGE=$(df -khT | grep -vE 'tmpfs|Filesystem' | awk '{print $6}' | tr -d %)
FileSystem=$(df -khT | grep -vE 'tmpfs|Filesystem' | awk '{print $1}')
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

echo -e "this script started executing at ${TIME}" &>> $LOGFILE

validate(){
    if [ $1 -eq 0 ]
    then
        echo -e "$2 is $G success $N"
    else
        echo -e "$2 is  $R failed $N"
    fi
}

if [ $ID -ne 0 ]
    then
        echo -e "$Y you are not root user, please re-try with root user $N"
        exit 1
    else
        echo -e "$G you are root user, hence proceeding $N"
fi

while IFS= read -r line
do
    messege="$FileSystem usage is: $line"
done <<< $USAGE

validate $? "usage checking"
