#!/bin/bash

rm -rf username_dist.txt
for file in $1/*/var/log/failed_login_data.txt; do
	echo file
	cat file > bestfilenameever.txt
done
echo bestfilenameever.txt
awk '{count[$4]++} END {for (username in count) print "data.addRow([\x27"username"\x27,"count[username]"]);"}' bestfilenameever.txt > username_dist.txt
echo username_dist.txt
wrap_contents.sh username_dist.txt "username_dist" username_dist.html
echo username_dist.html
