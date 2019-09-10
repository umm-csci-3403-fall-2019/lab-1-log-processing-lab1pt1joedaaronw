#!/bin/bash

#Input parameters:
#1 text file to be wraped
#2 prefix for header and footer files
#3 output file

head="${2}_header.html"
foot="${2}_footer.html"

cat $head $1 $foot > $3
