#!/bin/bash

BR=$1
CLON=$2
PORT=$3

# Generar MAC aleatoria con formato 00:0C:29:XX:YY:ZZ

MAC="00:0c:29:$(openssl rand -hex 1):$(openssl rand -hex 1):$(openssl rand -hex 1)"

# Crear mv

cd /root/images

qemu-system-x86_64 -m 128M -smp 1 -nographic --enable-kvm \
	-device e1000,netdev=net0,mac=$MAC \
	-netdev bridge,br=$BR,id=net0 \
	-serial mon:telnet::$PORT,server=on,wait=off \
	$CLON &
