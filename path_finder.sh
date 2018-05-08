#!/bin/bash

#find path of file, somwhere on the drive

fname=$1

fpath=$(find -name "$fname")

echo "$fpath"