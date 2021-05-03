#!/bin/bash

export KERNELNAME=ROCKET-KERNEL

export LOCALVERSION=-XR3.0.1

export KBUILD_BUILD_USER=AL1

export KBUILD_BUILD_HOST=#FunProject

export TOOLCHAIN=clang

export DEVICES=lavender

source helper

gen_toolchain

send_msg "🚀🚀Memulai Menerbangkan Rocket🚀🚀"

START=$(date +"%s")

for i in ${DEVICES//,/ }
do

	build ${i} -oldcam
	
	build ${i} -newcam
	
done

END=$(date +"%s")

DIFF=$(( END - START ))

send_msg "⚡Menderat Dengan Selamat | $((DIFF / 60))Menit $((DIFF % 60))Detik | Pembaruan: $(git log --pretty=format:'%h : %s' -5)⚡"
