#!/bin/bash

prepare_base.sh $1

cd /root/images
qemu-img create -F qcow2 -f qcow2 -b "$1.qcow2" "$2.qcow2"
