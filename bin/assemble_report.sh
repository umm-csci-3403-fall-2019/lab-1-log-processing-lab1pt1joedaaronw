#!/bin/bash

rm -f failed_login_summary.txt
rm -f failed_login_summary.html
cat $1/country_dist.html $1/hours_dist.html $1/username_dist.html > failed_login_summary.txt
bin/wrap_contents.sh failed_login_summary.txt "summary_plots" $1/failed_login_summary.html
rm -f failed_login_summary.txt
