#!/bin/bash
ID=$(id -u)
TIME=$(date +%F-%H-%M-%S)
LOGFILE="/tmp/$0-$TIME.log"
SOURCE_DIR="/etc/passwd"
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

if [ ! -f $SOURCE_DIR ]
then
    echo -e "$R $SOURCE_DIR does not exist $N"
    exit 1
else
    echo -e "$G $SOURCE_DIR exist, so proceeding $N"
fi


#DELETE=$(find $SOURCE_DIR -name *.log -mtime +30 -type f)


#while IFS=":" read -r username password UID GID fullname homefolder shell
while IFS=":" read -r username
do
    echo "username is: $username"
#    rm -rf $line
done <<< $SOURCE_DIR

validate $? "fetching passwd file entries"