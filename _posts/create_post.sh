#!/bin/bash

Date=`date '+%Y-%m-%d-'`

fileName="$Date$1.md"

touch $fileName 

cat template.txt > $fileName
