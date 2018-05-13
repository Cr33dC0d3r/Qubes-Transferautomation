#!/bin/bash

HOST='x.x.x.x'
USER='AppVM1'
PASSWD='********'

FILE=$1
ftp -n -v $HOST <<EOT
ascii
user $USER $ PASSWD
prompt
ls
lcd /path/to/
get $FILE
bye
EOT
