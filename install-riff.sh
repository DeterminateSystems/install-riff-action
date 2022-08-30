#!/usr/bin/env bash
set -euo pipefail

echo "::group::Installing Riff"

nix profile install "github:DeterminateSystems/riff"

exit 0
