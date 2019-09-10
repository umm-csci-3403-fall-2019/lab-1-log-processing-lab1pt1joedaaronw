#!/bin/bash

cd $1
awk '/Failed password for invalid user/ {print "1",$1,$2,$3,$11,$13,"\n",$0}
/: Failed password (?!for invalid user)/ {print "2",$1,$2,$3,$9,$11,"\n",$0}' var/log/*
