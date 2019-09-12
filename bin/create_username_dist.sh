#!/bin/bash

rm -rf username_dist.txt
rm -rf bestfilenameever.txt
rm -rf username_dist.html
for file  in $1/*/failed_login_data.txt
do
	cat $file >> bestfilenameever.txt
done
awk '{print $4}' bestfilenameever.txt | sort -fs | uniq -c | awk '{print "data.addRow([\x27"$2"\x27, "$1"]);"}' > username_dist.txt
bin/wrap_contents.sh username_dist.txt "username_dist" $1/username_dist.html
