#!/bin/bash

rm -f $1/country_dist.html
for file in $1/*/failed_login_data.txt
do
	cat $file >> data.txt
done
#We grab the fifth column from each line, map them to the appropriate country with join, then pipe the result to another awk command where we construct the JavaScript.
awk '{print $5}' data.txt | sort -fs > this.txt
join this.txt etc/country_IP_map.txt | awk '{print $2}' | sort -fs | uniq -c | awk '{print "data.addRow([\x27"$2"\x27, "$1"]);"}' > country_dist.txt
bin/wrap_contents.sh country_dist.txt "country_dist" $1/country_dist.html
rm -f data.txt this.txt country_dist.txt
