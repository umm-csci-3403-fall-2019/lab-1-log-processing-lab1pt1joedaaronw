#!/bin/bash

rm -rf hours_dist.html
rm -rf spicy.txt
rm -rf hours_dist.txt
for file in $1/*/failed_login_data.txt
do
	cat $file >> spicy.txt
done
awk '{print $3}' spicy.txt | sort -fs | uniq -c | awk '{print "data.addRow([\x27"$2"\x27, "$1"]);"}' > hours_dist.txt
bin/wrap_contents.sh hours_dist.txt "hours_dist" $1/hours_dist.html
rm -rf spicy.txt
rm -rf hours_dist.txt
