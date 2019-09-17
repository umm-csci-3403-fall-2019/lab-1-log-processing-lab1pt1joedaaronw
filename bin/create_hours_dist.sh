#!/bin/bash

rm -rf hours_dist.html
rm -rf data.txt
rm -rf hours_dist.txt
for file in $1/*/failed_login_data.txt
do
	cat $file >> data.txt
done
#We grab the third column from each line, count them, and write the corresponding JavaScript line.
awk '{print $3}' data.txt | sort -fs | uniq -c | awk '{print "data.addRow([\x27"$2"\x27, "$1"]);"}' > hours_dist.txt
bin/wrap_contents.sh hours_dist.txt "hours_dist" $1/hours_dist.html
rm -rf data.txt
rm -rf hours_dist.txt
