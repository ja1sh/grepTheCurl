# grepTheCurl Guide:
One liner regex match to search inside JS files, using curl and grep!

### Gather urls from Hakrawler:
hakrawler -url https://redacted.com -plain -depth 3 | tee -a /urls.txt

### Bonus:
Prefix the urls with correct syntax which will be accepted by the 'curl'
`sed 's/^/url=/;' /urls.txt | tee -a /curls.txt`

### grep the regex in server response:
`curl -sS -K /curls.txt | grep -Eoi "REGEX"`

Author: Jai Kumar Sharma
