#!/bin/bash

# Script som starter serveren.
# Apache blir installert og satt opp i server-data.sh



openstack server create \
--flavor m1.small \
--image 1676adb4-9657-42ed-b31f-b3907cbcd697 \
--key-name manager \
--security-group default \
--network net1 \
--user-data /home/ubuntu/iac/BashScipts/server-data2.sh \
webserver

