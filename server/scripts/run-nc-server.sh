#!/bin/sh

port=$1
file=$2

nc -l $port > $file

