#!/bin/bash

apt-get update

apt-get upgrade

echo -e "\n\ninstalling redis-server ......\n\n"

apt install redis-server

echo -e "\n\nTurning off redis-server ......\n\n"

service redis stop

read -p "Enter the old server-ip-address -> " ip

echo -e "\n\nRunning scp command with -> $ip ip address\n\n"

sudo scp root@$ip:/var/lib/redis/dump.rdb /var/lib/redis/dump.rdb

echo -e "\n\nRestarting redis-server ......\n\n"

service redis start

echo -e "\n\nDone Installing New Redis DB\n"

echo -e "\nAfter 5 Sec will run redis-cli keys test\n\n"

sleep 3

redis-cli keys "*"
