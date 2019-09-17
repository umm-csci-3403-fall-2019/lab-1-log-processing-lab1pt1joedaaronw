#!/bin/bash

rm -rf username_dist.txt
rm -rf data.txt
rm -rf username_dist.html
for file  in $1/*/failed_login_data.txt
do
	cat $file >> data.txt
done
#We grab the fourth column from each line, sort them, count them, then write the appropriate JavaScript line.
awk '{print $4}' data.txt | sort -s | uniq -c | awk '{print "data.addRow([\x27"$2"\x27, "$1"]);"}' > username_dist.txt
bin/wrap_contents.sh username_dist.txt "username_dist" $1/username_dist.html
rm -rf data.txt
rm -rf username_dist.txt
