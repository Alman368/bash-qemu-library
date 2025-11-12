#!/bin/bash

set -e

# Comprueba si existe la carpeta, sino la crea
 
if [ ! -d "/root/shared" ]; then
	mkdir -p /root/shared
fi

# Si no existe el disco base, lo descarga

if [ ! -f "/root/shared/$1.qcow2" ]; then
	wget -O "/root/shared/$1.qcow2" "http://www.ho.ac.uma.es/virt/installed-systems/$1.qcow2"
fi

# Si no existe la carpeta la creamos
if [ ! -d "/root/images" ]; then
	mkdir -p /root/images
fi

# Borrar enlace anterior si ya existe
[ -L "/root/images/$1.qcow2" ] && rm "/root/images/$1.qcow2"

# Creamos enlace simbólico
ln -s "/root/shared/$1.qcow2" "/root/images/$1.qcow2" 
