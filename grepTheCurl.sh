#!/bin/bash

line="$1"
echo 'Welcome to grepTheCurl: Hakrawling on' $1

# Just to check if hakrawler is installed or not
if ! command -v hakrawler &> /dev/null
then
    echo "[x] Missing requirements..."
    echo "[x] hakrawler could not be found."
    echo "[x] please check this to install : https://github.com/hakluke/hakrawler"
    exit
fi

hakrawler -url $line -plain -depth 3 | tee -a /urls.txt
sed 's/^/url=/;' /urls.txt | tee -a /curls.txt
curl -sS -K /curls.txt | grep -Eoi "REGEX"
