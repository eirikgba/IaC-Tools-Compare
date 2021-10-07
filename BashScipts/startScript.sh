#!/bin/bash

# Script som starter servere og servicen

# Endre user-data path til riktig på manager VM

openstack server create \
--flavor m1.small \
--image 1676adb4-9657-42ed-b31f-b3907cbcd697 \
--key-name Manager \
--security-group default \
--user-data /home/ubuntu/git/DCSG2003/vms/server/server-data.sh \
server1

openstack server create \
--flavor m1.small \
--image 1676adb4-9657-42ed-b31f-b3907cbcd697 \
--key-name Manager \
--security-group default \
--user-data /home/ubuntu/git/DCSG2003/vms/server/server-data.sh \
server2
