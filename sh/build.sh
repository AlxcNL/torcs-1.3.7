#!/usr/bin/env sh

(
	cd ..;
	make clean;
	./configure;
	make;
	sudo make install;
	sudo make datainstall;
	
)
