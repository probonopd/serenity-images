#!/bin/sh

# 22.04 (Jammy) and later
# https://github.com/SerenityOS/serenity/blob/master/Documentation/BuildInstructions.md

sudo apt install build-essential cmake curl libmpfr-dev libmpc-dev libgmp-dev e2fsprogs ninja-build qemu-system-gui qemu-system-x86 qemu-utils ccache rsync unzip texinfo libssl-dev

sudo apt install gcc-12 g++-12

git clone --depth 1 https://github.com/SerenityOS/serenity

cd serenity/

# build the toolchain
Meta/serenity.sh rebuild-toolchain

# build and run SerenityOS
Meta/serenity.sh run
