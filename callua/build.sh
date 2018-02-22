#!/usr/bin/env bash

cd $(dirname $0) || exit 1
if [ "X$1" == "Xclean" ]; then
	rm generateXml hello_world
	exit 0
fi

g++ -o generateXml generateXml.cpp -llua
g++ -o hello_world hello_world.cpp -llua
