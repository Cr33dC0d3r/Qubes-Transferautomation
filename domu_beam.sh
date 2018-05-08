#!/bin/bash

#This Script automatically copy this script to another Guest-VM

fname=$1
dest_vm=$2

fpath=$(path_finder.sh "$fname")

echo $fpath
echo "Beam this file to $dest_vm"

qvm-copy-to-vm $dest_vm $fpath
