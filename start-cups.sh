#!/bin/sh
set -e
set -x

if [ $(grep -ci $CUPS_USER_ADMIN /etc/shadow) -eq 0 ]; then
	useradd --groups=sudo,lp,lpadmin --create-home --home-dir=/home/$CUPS_USER_ADMIN --shell=/bin/bash $CUPS_USER_ADMIN
	echo $CUPS_USER_ADMIN:$CUPS_USER_PASSWORD | chpasswd
fi

exec /usr/sbin/cupsd -f
