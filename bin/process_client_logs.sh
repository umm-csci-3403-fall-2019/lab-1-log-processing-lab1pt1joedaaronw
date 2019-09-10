#!/bin/bash

cd $1
awk '/Failed password for invalid user/ {print $1,$2,substr($3,1,2),$11,$13}
/Failed password for *[^ ]* from/ {print $1,$2,substr($3,1,2),$9,$11}' var/log/* >  failed_login_data.txt
