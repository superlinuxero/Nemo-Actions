!/bin/bash

#
# This script needs pdfsig, awk, gsub and zenity
#


file=`echo "$@" | sed 's/\\\ / /g'`

#
# Checking against pdfsig signature status and assign response to variable
#

result=`pdfsig "$file" 2>/dev/null`


#
# Finally, we show final result in a zenity text box
#


echo "$result" | zenity --title "PDF Signature Status" --width=640 --height=480  --text-info
