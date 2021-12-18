#!/usr/bin/env bash

for name in $HOME/uni/*/*/master.pdf
do
	cp "$name" "$(pwd)/$(basename -- "$(dirname -- "$name")").pdf"
done
