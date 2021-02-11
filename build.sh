#!/bin/bash

export KERNELNAME=ROCKET

export LOCALVERSION=-CR1

export KBUILD_BUILD_USER=Ali

export KBUILD_BUILD_HOST=#FunProject

export TOOLCHAIN=clang

export DEVICES=lavender

source helper

gen_toolchain

send_msg "Memulai Build..."

START=$(date +"%s")

for i in ${DEVICES//,/ }
do

	build ${i} -oldcam
	
	build ${i} -newcam
	
done

END=$(date +"%s")

DIFF=$(( END - START ))

send_msg "Build Selesai | $((DIFF / 60))Menit $((DIFF % 60))Detik | Pembaruan: $(git log --pretty=format:'%h : %s' -5)"
