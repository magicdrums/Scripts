#!/bin/sh
IP=$(wget https://my.pingdom.com/probes/feed -O pingdom_ip)
ONLYIP=$(awk '/<pingdom:ip>/' pingdom_ip)
echo $ONLYIP \n
