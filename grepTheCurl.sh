#!/bin/bash
line="$1"
echo 'Welcome to grepTheCurl: Hakrawling on' $1
hakrawler -url $line -plain -depth 3 | tee -a /urls.txt
sed 's/^/url=/;' /urls.txt | tee -a /curls.txt
curl -sS -K /curls.txt | grep -Eoi "REGEX"
