#!/bin/bash
ID=$(id -u)
TIME=$(date +%F-%H-%M-%S)
LOGFILE="/tmp/$0-$TIME.log"
SOURCE-DIR=`echo "/tmp/shell-script-logs"`
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"s

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

if [ ! -d $SOURCE-DIR ]
then
    echo -e "$R ${SOURCE-DIR} does not exist $N"
    exit 1
else
    echo -e "$G ${SOURCE-DIR} exist, so proceeding $N"
fi


DELETE=$(find $SOURCE-DIR -name *.log -mtime +30 -type f)

while IFS= read -r line
do
    echo "deleting line: $line"
    rm -rf $line
done <<< DELETE &>> $LOGFILE

validate $? "deleting log files"