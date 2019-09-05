#!/bin/bash

cd $1
cat 'ls' | awk '/invalid user/ {echo $1 $2 $3 $11 $13}
/^invalid user/ {echo $1 $2 $3 $9 $11}'
