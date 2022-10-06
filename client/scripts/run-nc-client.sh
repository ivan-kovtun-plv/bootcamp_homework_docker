#!/bin/sh

ipaddress=$1
port=$2
file=$3

if [ -f $file ]; then
    nc $ipaddress $port < $file -q 1
else
    echo Error: $file is not a regular file
    exit 1
fi

