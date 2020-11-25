#!/bin/bash

if [ "$#" == 2 ]
then
	ID="$2"
	DATUM="$1"
	D=${DATUM:0:2}
	echo "$D"
	M=${DATUM:3:2}
	echo "$M"
	Y=${DATUM:6:4}
	echo "$Y"
	STARTTIME=$(date -d "$M"/"$D"/"$Y" +'%s')
	echo 'start time:' "$STARTTIME" 
	ENDTIME=$(echo "$STARTTIME"'+60*60*24' | bc)
	echo 'end time:' "$ENDTIME"
	shift
	curl -s 'https://aviationweather.gov/adds/dataserver_current/httpparam?dataSource=metars&requestType=retrieve&format=csv&stationString='"$ID"'&startTime='"$STARTTIME"'&endTime='"$ENDTIME" 
else
	echo 'Nespravny pocet argumentov'
fi
