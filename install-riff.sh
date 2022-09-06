#!/usr/bin/env bash
set -euo pipefail

ARCH="x86_64"
SYSTEM=$(uname | tr '[:upper:]' '[:lower:]')
# RIFF_VERSION is set by action.yml

echo "::group::Installing riff ${RIFF_VERSION} on ${SYSTEM}"

INSTALL_URL="https://github.com/DeterminateSystems/riff/releases/download/v${RIFF_VERSION}/riff-${ARCH}-${SYSTEM}"

echo "::group::Downloading from ${INSTALL_URL}"

curl -Lo riff "${INSTALL_URL}"
sudo mkdir -p /usr/local/bin
sudo install -m +x ./riff /usr/local/bin/riff

echo "::group::Riff ${RIFF_VERSION} installed"

exit 0
