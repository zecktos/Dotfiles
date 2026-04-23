#!/bin/bash

city=""

weather=$(curl "wttr.in/$city?format=1")
echo "$weather"
echo "---"
echo "$(curl "wttr.in/$city?format=%l:+\n+%C+%t\n%w+\n+%m+%M")"
