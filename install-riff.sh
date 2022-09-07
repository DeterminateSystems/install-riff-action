#!/usr/bin/env bash
set -euo pipefail

# Support only standard ubuntu and macos runners for now
ARCH="x86_64"

# Other constants
INSTALL_DIR="/usr/local/bin"
EXECUTABLE="riff"

# Variables
SYSTEM=$(uname | tr '[:upper:]' '[:lower:]') # Ubuntu -> ubuntu or Darwin -> darwin
# RIFF_VERSION is set by action.yml
INSTALL_URL="https://github.com/DeterminateSystems/riff/releases/download/v${RIFF_VERSION}/riff-${ARCH}-${SYSTEM}"

echo "::group::Installing riff ${RIFF_VERSION} on ${SYSTEM}"
echo "::group::Downloading from ${INSTALL_URL}"

# Installation process
curl -Lo "${EXECUTABLE}" "${INSTALL_URL}"
sudo mkdir -p "${INSTALL_DIR}"
sudo install -m +x "${EXECUTABLE}" "${INSTALL_DIR}/${EXECUTABLE}"
rm "${EXECUTABLE}"

echo "::group::Riff ${RIFF_VERSION} installed"

exit 0
