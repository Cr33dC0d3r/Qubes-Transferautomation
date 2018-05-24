#!/bin/bash
#This script downloads two specific files from an static dir on a ftp-server
HOST='x.x.x.x'
USER='AppVM1'
PASSWD='********'

FILE=$1                 #Enter the name of the encrypted file
SIG=$2                  #Enter the name of the detached signature
ftp -n -v $HOST <<EOT
ascii
user $USER $ PASSWD
prompt
ls
lcd /path/to/
get $FILE
bye
EOT
