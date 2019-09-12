#!/bin/bash

echo "please help me"
echo $0
echo $1
rm -rf username_dist.txt
ls $1
for file  in $1/*/failed_login_data.txt
do
	#file = $dir/failed_login_data.txt
	echo $file
	cat $file >> bestfilenameever.txt
done
echo bestfilenameever.txt
awk '{printf $4"\n"}' bestfilenameever.txt > username_dist.txt
sort "username_dist.txt" | uniq -c >> username_dist.txt
echo username_dist.txt
bin/wrap_contents.sh username_dist.txt "username_dist" $1/username_dist.html
echo username_dist.html
