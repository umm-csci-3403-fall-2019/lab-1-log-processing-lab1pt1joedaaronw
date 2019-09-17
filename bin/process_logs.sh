#!/bin/bash

scratch=$(mktemp -d)
:'$@ is all of the zipped input files
We create an appropriate subdirectory in our scratch for each one.
We run process_client_logs.sh on each such subdirectory.
We run each create_foo_dist.sh script on our scratch directory, then put them all together with assemble_report.sh.
We copy the result from our scratch into the directory the script is run in.'
for zip in $@
do
	out=$(basename "$zip" "_secure.tgz")
	mkdir $scratch/$out
	tar -xzf $zip -C $scratch/$out
done
for dir in $scratch/*
do
	bin/process_client_logs.sh $dir
done
bin/create_username_dist.sh $scratch
bin/create_hours_dist.sh $scratch
bin/create_country_dist.sh $scratch
bin/assemble_report.sh $scratch
cp  $scratch/failed_login_summary.html failed_login_summary.html
