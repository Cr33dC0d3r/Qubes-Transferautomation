#!/bin/bash

#This init script shall initialize the system (excluding create & configure AppVM's)

#First: Start ftp-backend server and check if service is running:
# -> This will start and enable service if it is not active, but stay in current state if already active

qvm-run backend-ftp "sudo systemctl start vsftpd"
service_out=$(qvm-run backend-ftp "sudo systemctl enable vsftpd")
if [$service_out == ""]
	then
	echo "Service is already up and running!"
fi

#Second: generate Keys for sign file X (do not need key on Dom2 since Dom2 is only verifying??)

qvm-run backend-ftp "cd /Path/to/Script/"
qvm-run backend-ftp "./key-gen_be.sh"

#Third: export pubk and move to Dom1
qvm-run backend-ftp "sudo gpg --export --armor > /Path/to/pubk/pubk.asc"

echo "List of loaded Public Keys on Backend"
qvm-run -p backend-ftp "gpg --list-keys" 
echo "List of loaded Secret Keys on Backend"
qvm-run -p backend-ftp "gpg --list-secret-keys"
echo "Copy Public Key ..."
cd
cd /Path/to/dom0-Scripts/
./master-beam_dom0.sh
#qvm-run backend-ftp "qvm-move-to-vm --without-progress Dom1 /Path/to/Pubk/pubk.asc"
#qvm-run Dom1 "sudo mv /Path/to/Pubk/pubk.asc /Path/to/cpPubk/pubk.asc"
#qvm-run	Dom1 "sudo gpg --import /Path/to/cpPubk/pubk.asc"

#fop=$(
qvm-run -p Dom1 "gpg --list-keys"
#)
#fop_a=(`echo $fop | tr "pub" " "`)
#IFS='2048R' read -r -a fop_a <<< "$fop"
#echo $fop_a
