#!/bin/bash

if [[ $(echo $*) ]]; then

    searchterm="$*"
else
        read -p "Enter your search term: " searchterm
fi
songname=$(echo $searchterm | sed -e 's/\ /+/g')
searchterm="azlyrics"+$songname
#echo $searchterm
links=$(lynx -dump http://www.google.com/search?q=$searchterm | grep html | head -n1)
#echo $link
result=$(echo $links | awk -F ' ' '{print $1}' )
echo $result

lynx -dump $result | sed -n '/LYRICS$/,/Submit Corrections$/p' | sed '1d;$d'
#lyrics=$( echo $page | sed -n '/*LYRICS$/,/*Submit Corrections$/p')
#echo $lyrics
