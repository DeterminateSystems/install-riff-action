#!/usr/bin/env bash
set -euo pipefail

ARCH="x86_64"
VERSION="1.0.0"
SYSTEM=$(uname | tr '[:upper:]' '[:lower:]')

echo "::group::Installing riff ${VERSION} on ${SYSTEM}"

INSTALL_URL="https://github.com/DeterminateSystems/riff/releases/download/v${VERSION}/riff-${ARCH}-${SYSTEM}"

echo "::group::Downloading from ${INSTALL_URL}"

curl -Lo riff "${INSTALL_URL}"
sudo mkdir -p /usr/local/bin
sudo install -m +x ./riff /usr/local/bin/riff

echo "::group::Riff ${VERSION} installed"

exit 0
