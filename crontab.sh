#!/bin/bash
# Reference to http://blog.csdn.net/fdipzone/article/details/22701113

# Interval seconds
step=5

for ((i=0; i<60; i=(i+step)));do
	$(COMMAND_PATH FILE_PATH)
	sleep $step
done

exit 0
