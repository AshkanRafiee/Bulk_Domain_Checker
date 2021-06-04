#!/bin/bash
# Author: Ashkan Rafiee


iter=0
uiter=0
while true; do
for domain in `cat domains.txt`
do
      whois $domain | egrep -q \
      '^No match|^NOT FOUND|^Not fo|AVAILABLE|^No Data Fou|has not been regi|No entri'
	  if [ $? -eq 0 ]; then
	      let "iter += 1"
	      let "uter += 1"
	      echo "$uiter $domain : Available!"
	       if [ $iter -eq 18 ]; then
		sleep 60s
		echo "Waiting for One Minute!"
		let "iter = 0"
	       fi
	  else
	      let "iter += 1"
	      let "uiter += 1"
	      echo "$uiter $domain : Taken!"
	       if [ $iter -eq 18 ]; then
		sleep 60s
		echo "Waiting for One Minute!"
		let "iter = 0"
	       fi
	  fi
done
done
