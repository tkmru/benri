#!/bin/sh
set -eu

if [ ! -d ./results/${today} ]; then
  mkdir -p ./results/${today}
fi

if [ $# -eq 0 ]; then
  echo 'specify ip range' 1>&2
  echo 'get_alive_ip.sh <ip range>' 1>&2
  exit 1
fi

now=`date +%Y%m%d_%H%M%S`
nmap -v -sn $1 -oX "results/${today}/alive_ip_${now}.xml"