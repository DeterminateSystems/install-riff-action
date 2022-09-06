#!/usr/bin/env bash
set -euo pipefail

echo "::group::Installing riff"

nix profile install "github:DeterminateSystems/riff"

VERSION=$(riff --version)

echo "::group::${VERSION} installed"

exit 0
