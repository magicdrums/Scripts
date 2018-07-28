#!/bin/bash
channel=$1
alarmtext=$2
alarmid=$3

cd /var/spool/alarm
echo $alarmtext > alarm$alarmid.txt
text2wave alarm$alarmid.txt -o alarm$alarmid.tmp.wav -eval "(voice_JuntaDeAndalucia_es_sf_diphone)"
/usr/bin/sox alarm$alarmid.tmp.wav -r 8000 alarm$alarmid.ul
/bin/mv -f alarm$alarmid.ul alarm$alarmid.ulaw
/bin/rm alarm$alarmid.tmp.wav
 
echo "Channel: $1
MaxRetries: 2
RetryTime: 60
WaitTime: 30
Context: alarm
Extension: s 
Priority: 1
Set: alarmid=$alarmid" > alarm$alarmid.call 

/bin/chmod 777 alarm$alarmid.call 
/bin/mv alarm$alarmid.call /var/spool/asterisk/outgoing