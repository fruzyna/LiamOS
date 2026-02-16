#!/usr/bin/bash

set -eoux pipefail

###############################################################################
# Main Build Script
###############################################################################
# This script follows the @ublue-os/bluefin pattern for build scripts.
# It uses set -eoux pipefail for strict error handling and debugging.
###############################################################################

echo "Building $LIAMOS_IMAGE_NAME"

echo "::group:: Copy Custom Files"

# Consolidate Just files
mkdir -p /usr/share/ublue-os/just/
find /ctx/custom/ujust -iname '*.just' -exec printf "\n\n" \; -exec cat {} \; >> /usr/share/ublue-os/just/60-custom.just

# Copy Flatpak preinstall files
mkdir -p /etc/flatpak/preinstall.d/
cp /ctx/custom/flatpaks/*.preinstall /etc/flatpak/preinstall.d/

# Copy bazaar service file
cp /ctx/oci/common/bluefin/usr/lib/systemd/user/bazaar.service /usr/lib/systemd/user

# Copy udev rules
cp /ctx/oci/common/shared/usr/lib/udev/rules.d/* /usr/lib/udev/rules.d

# Copy color profiles
cp /ctx/oci/common/shared/usr/share/color/icc/colord/* /usr/share/color/icc/colord

echo "::endgroup::"

# Manually run build scripts in order, this allegedly happens automatically, but I haven't seen that
/ctx/build/01-akmods.sh
/ctx/build/02-packages.sh
/ctx/build/03-systemd.sh
/ctx/build/04-cleanup.sh

echo "Custom build complete!"
