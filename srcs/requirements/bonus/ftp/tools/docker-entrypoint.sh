#!/usr/bin/env bash

if [ "$1" = "ftp" ]; then 
	useradd -d /wordpress -G www-data $FTP_USER
	echo "$FTP_USER:$FTP_PASS" | chpasswd
	chmod 775 /wordpress
	sed -i 's,\r,,;s, *$,,' /etc/vsftpd.conf
	vsftpd /etc/vsftpd.conf
fi

exec "$@"