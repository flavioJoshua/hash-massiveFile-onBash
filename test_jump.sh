#!/bin/bash

function jumpto
{
    label=$1
    cmd=$(sed -n "/$label:/{:a;n;p;ba};" $0 | grep -v ':$')
    eval "$cmd"
    exit
}

echo " jmump to"

jumpto  salta

echo " parte saltata"

exit
salta:

echo " blocco salta"