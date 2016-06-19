#!/bin/bash
# Check for valid digital ocean token via api 
digitaloceantoken=$(cat references/.keys/digitaloceantoken)

authorization=$'"Authorization: Bearer '$digitaloceantoken'"'
urlstub='https://api.digitalocean.com/v2/'
content='"Content-Type: application/json"'
set -- account
echo $1
echo $2
apiurl=$'"'$urlstub$1$2'"'
echo $apiurl
echo "##########"
eval "curl -s -X GET -I " $content" -H " $authorization $apiurl
set -- "droplets?page=1&per_page=1"
apiurl=$'"'$urlstub$1$2'"'

eval "curl -s -X GET " $content" -H " $authorization $apiurl
exit 0
