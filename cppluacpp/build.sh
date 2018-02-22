#!/usr/bin/env bash

cd $(dirname $0) || exit 1
if [ "X$1" == "Xclean" ]; then
	rm cppmain
	exit 0
fi

g++ -o cppmain cppmain.cpp -llua
