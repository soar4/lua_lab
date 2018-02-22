#!/usr/bin/env bash

cd $(dirname $0) || exit 1
if [ "X$1" == "Xclean" ]; then
	rm *.so
	exit 0
fi

g++ -o libgenerateCppSo.so -shared -fPIC generateCppSo.cpp -llua
gcc -Wall -O2 -shared -o mytest.so lua_mytest.c -fPIC -llua
