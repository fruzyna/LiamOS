#!/usr/bin/env bash

# Tell build process to exit if there are any errors.
set -oue pipefail

echo "::group:: Configure Systemd"

systemctl --global enable bazaar.service

systemctl enable podman.socket

# replace Fedora update timer with mine
systemctl enable update-system.timer
systemctl disable rpm-ostreed-automatic.timer

echo "::endgroup::"
