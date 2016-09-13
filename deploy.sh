#!/usr/bin/env bash
#!/bin/sh
export PATH=/usr/lib64/qt-3.3/bin:/usr/local/mysql/bin/:/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/data/jdk1.6.0_45/bin:/opt/node-v4.4.0-linux-x64/bin:/root/bin

WEB_PATH='/data/webroot/staticFile/deploy'

echo "start server..."
cd $WEB_PATH && DEBUG=myapp npm start
echo "stop & quit"
echo "see you next time~"