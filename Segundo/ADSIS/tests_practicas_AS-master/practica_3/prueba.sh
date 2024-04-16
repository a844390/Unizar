#!/bin/bash

for pal in $(awk -F ',' '{print $1}' "$1")
do 
    echo "$pal"
done