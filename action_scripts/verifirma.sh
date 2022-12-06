#!/bin/sh

#
# This script needs pdfsig, awk, gsub and zenity
# pdfsig can be quite picky with filename with special characterts
# so we'll copy the file to a temmporary location (home directory)
# Variable Declaration and Copying File to a temporary location
#


mkdir -p /tmp/pdfcheck-$USER
cd /tmp/pdfcheck-$USER

file="$@"
cp "$file" pdfsigcheck.pdf


#
# Checking against pdfsig signature status and assign response to variable
#

result=`pdfsig pdfsigcheck.pdf 2>/dev/null`

#
# Cleaning a little the response from pdfsig, top remove single quotes and temp file name
#

finalresult=`echo "$result" | awk '{gsub("pdfsigcheck.pdf","");print}' | awk '{gsub("\047\047","");print}' | awk '{gsub("Digital Signature Info of: ","");print}' `


#
# Finally, we show final result in a zenity text box
#


echo $finalresult | zenity --title "PDF Signature Status" --width=640 --height=320  --text-info




#
# and delete temp file
#

rm pdfsigcheck.pdf
