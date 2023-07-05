#!/bin/sh

# 22.04 (Jammy) and later
# https://github.com/SerenityOS/serenity/blob/master/Documentation/BuildInstructions.md

# TODO: Port more from https://github.com/SerenityOS/serenity/blob/master/Meta/Azure/Serenity.yml if needed

sudo apt install build-essential cmake curl libmpfr-dev libmpc-dev libgmp-dev e2fsprogs ninja-build qemu-utils ccache rsync unzip texinfo libssl-dev grub2 parted

sudo apt install gcc-12 g++-12

git clone --depth 1 https://github.com/SerenityOS/serenity

cd serenity/

# Build the toolchain
Meta/serenity.sh rebuild-toolchain

# Build SerenityOS image
Meta/serenity.sh image

# https://github.com/SerenityOS/serenity/blob/master/Documentation/AdvancedBuildInstructions.md#ninja-build-targets
cd Build/x86_64
# https://github.com/SerenityOS/serenity/blob/master/Documentation/BareMetalInstallation.md
ninja grub-image

ls -lh
find ~ -name grub_disk_image || true

tar cfvj grub_disk_image.tar.bz2 grub_disk_image || true
ls -lh *.tar.bz2 || true
