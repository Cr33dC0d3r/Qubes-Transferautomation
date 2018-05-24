#!/bin/bash

#Verify and Decrypt file
#verify
cd /path/to/received/files && gpg --verify SIG

#decrypt
dec_key=$(cat /path/to/symmetric/key)
cd /path/to/received/files 
gpg --passphrase $dec_key --output /path/to/decrypted/dFILE --decrpyt FILE

#execute (in case it is a script we have to use following commands)
cd /path/to/decrypted/dFILE && chmod +x dFILE && ./dFILE
