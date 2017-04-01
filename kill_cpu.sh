#!/usr/bin/env bash
# Reference to
# http://bbs.chinaunix.net/thread-1054020-1-1.html
# http://6226001001.blog.51cto.com/9243584/1612127
# https://my.oschina.net/leejun2005/blog/150662
# http://www.jb51.net/article/40475.htm
# http://www.cnblogs.com/killkill/archive/2010/09/08/1821496.html

# filename: kill_cpu.sh

cd `dirname $0` ;

if [ -f "release_cpu.sh" ]; then
    rm -f release_cpu.sh
    echo "Delete"
fi

if [ $# != 1 ]; then
    echo "Usage: $0 <CPUs>"
    exit 1
fi

for i in `seq $1`; do
    echo -ne "
    i=0;
    while true
    do
    i=i+1;
    done
    " | /bin/bash &
        pid_array[$i]=$!;
done


RELEASE_FILE (){
for i in "${pid_array[@]}"; do
    echo 'kill -9' $i ';' >> release_cpu.sh ;
done

sed -i 1'i\#!/bin/bash' release_cpu.sh

echo "release_cpu.sh has been generated."
}


RELEASE_FILE
