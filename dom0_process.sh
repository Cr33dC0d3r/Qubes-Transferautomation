#!/bin/bash

#This Script defines the main process.
dest_vm_dl= NameOfDownloadDestVM
dest_vm_tf= NameOfTransferDestVM
std_scrbase='/path/to/domU/scripts/'
dom0_scrbase='/path/to/dom0/scripts/'

#Start Downloading the Update + Signature
echo "Downloading Encrypted & Signed Update ..."
qvm-run -p $dest_vm_dl "cd $std_scrbase && ./ftp_download.sh FILE_name SIG_name"

#Start Transtfer Files from dest_vm_dl to dest_vm_tf
echo "Moving Update in next Domain ..."
cd $dom0_scrbase && ./dom0_beam.sh $dest_vm_dl /path/to/FILE $dest_vm_tf /path/to/FILE
cd $dom0_scrbase && ./dom0_beam.sh $dest_vm_dl /path/to/SIG $dest_vm_tf /path/to/SIG

#Start Signature Verification, Decryption & Enforcement.
qvm-run -p $dest_vm_tl "cd $std_scrbase && ./verify_decrypt_enforce.sh"

#If the command above completes its task, the process has finished.
