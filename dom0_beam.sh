#!/bin/bash

#Dom0 Beam

src_dir=$1    #Case Sensitive!
dest_dir=$3   #Case Sensitive!
src_vm=$2
dest_vm=$4

# Now we need to execute qubes command to pass I/O
# using a pipe from one VM to another

echo "File Transfer established: $src_vm -> $dest_vm !"

qvm-run -p $src_dir "cat $src_dir" | qvm-run -p $dest_vm "cat > $dest_dir"

echo "File Transmitted!"
