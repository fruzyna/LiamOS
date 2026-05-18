#!/bin/bash
if lsusb | grep "Fingerprint" >/dev/null &&
    authselect list-features local | grep with-fingerprint >/dev/null &&
    ! authselect is-feature-enabled with-fingerprint; then
    authselect enable-feature with-fingerprint
fi