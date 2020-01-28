#!/bin/sh

#printf "\033c" > /dev/tty10 || exit 1

aarch64-linux-gnu-objcopy zig-cache/bin/trOS -O binary kernel.img || exit 1

qemu-system-aarch64 -serial stdio -M raspi3 -kernel kernel.img -display sdl -m 256 || exit 1

#printf "\033c" > /dev/tty10 || exit 1
