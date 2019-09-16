#!/bin/bash

rm -f $1/country_dist.html
for file in $1/*/failed_login_data.txt
do
	cat $file >> umami.txt
done
#join umami.txt etc/country_IP_map.txt > this.txt
awk '{print $5}' umami.txt | sort -fs > this.txt
join this.txt etc/country_IP_map.txt | awk '{print $2}' | sort -fs | uniq -c | awk '{print "data.addRow([\x27"$2"\x27, "$1"]);"}' > country_dist.txt
bin/wrap_contents.sh country_dist.txt "country_dist" $1/country_dist.html
cat $1/country_dist.html
rm -f umami.txt this.txt country_dist.txt
