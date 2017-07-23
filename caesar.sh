#!/bin/sh

usage()
{
  echo "Usage: caesar.sh [rotation]
  
  This program will read from stdin and rotate (shift right) the text by the specified roation. If none is specified, the default value is 13."
  exit 1
}

target()
{
alphaL=({a..z})
alphaU=({A..Z})
letter=$((n%26))
if [ "$letter" == 0 ]; then
  tar="a-zA-Z"
else
  tar="${alphaL[letter]}""-za-""${alphaL[letter-1]}""${alphaU[letter]}""-ZA-""${alphaU[letter-1]}"
fi
}

if [ "$1" == "-h" ]; then
  usage
fi

if [ $# == 0 ]; then
  n=13
else
  n=$1
fi

target

tr a-zA-Z "$tar"
