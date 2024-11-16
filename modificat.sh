#!/bin/bash

nume=$1
ip_ver=$2
server_dns=$3
actual_ip=$(nslookup "$nume" "$server_dns" | grep -A 1 "Name:" | tail -n 1 | awk '{print $2}')
if [ "$actual_ip" != "$ip_ver" ]; then
	echo "Bogus IP for $nume!"
fi
