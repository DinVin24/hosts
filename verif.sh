#!/bin/bash

cat /etc/hosts | grep -v '^#' | grep -v '^$' | while read ip name; do
	corect=$(nslookup "$name" | grep -A 1 "Name:" | tail -n 1 | awk '{print $2}')
	if [ "$corect" != "$ip" ]; then
		echo "Bogus IP for $name in /etc/hosts !"
	fi
done
