#!/bin/sh

main() {
source ./logo.sh
echo -e '\t\033[0;37m'USER \& HOST: $USER@$HOSTNAME '\n\t'TIME: $TIME '\n\t'DISTRO: $dist
echo -e '\t'CPU $CPU';' Cores: $CORES '\n\t'CPU Architecture: $Arch '\n\t'GPU $GPU 
echo -e '\t'RAM $RAM
echo -e '\t'RAM $RAMFREE
}

dist=$(lsb_release -ds)
TIME="$(date +"%T")"
CPU="$(grep -m 1 'model name' /proc/cpuinfo)"
CORES="$(grep -c 'model name' /proc/cpuinfo)"
Arch="$(uname --machine)"
GPU="$(glxinfo | grep -Ei 'device|memory' | grep Device)"
RAM="$(grep MemTotal /proc/meminfo)"
RAMFREE="$(grep MemFree /proc/meminfo)"
main