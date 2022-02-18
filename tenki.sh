#!/bin/bash

#echo "tormorrow min forecast " $(cat sample | jq '.forecasts[1] | .temperature | .min | .celsius')

#ID=400040

if [ $# -eq 0 ]
then
    echo "Usage : $(basename $0) ID"
    echo "example : $(basename $0) 400040"
    exit 1
fi

ID=$1

# -----------------------------------------------------------------
#cat sample                                                       |
curl -s https://weather.tsukumijima.net/api/forecast/city/${ID}   |
# -----------------------------------------------------------------
jq '
 #-----------------------
 # 
 #-----------------------
 .forecasts[1]          | 
 #-----------------------       
 .temperature           | 
 #-----------------------       
 .min                   | 
 #-----------------------
 .celsius'              |
#tee data               |
# ----------------------------------
sed s/\"//g |
# ----------------------------------
# header
# ----------------------------------
cat <(echo -n "tomorrow min temperature ") -


