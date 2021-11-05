#!/usr/bin/env bash

# The architecture from the arch command doesn't always match those for the dnscrypt releases.
# We modify them here if required.

ARCH=$(arch)

case "$ARCH" in
    aarch64 )
         ARCH=arm64
         ;;
    armv7l )
         ARCH=arm
         ;;
    esac

# Install dependencies
apt-get update -yq
apt-get -yq --no-install-recommends install wget
wget https://github.com/DNSCrypt/dnscrypt-proxy/releases/download/2.1.1/dnscrypt-proxy-linux_$ARCH-2.1.1.tar.gz
tar -xvf dnscrypt-proxy-linux_$ARCH-2.1.1.tar.gz
cp /tmp/linux-$ARCH/dnscrypt-proxy /usr/local/bin

# Cleanup
rm -rf /tmp/dnscrypt-proxy*
