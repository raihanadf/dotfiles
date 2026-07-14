#!/usr/bin/env bash
# Keeps the rofi-command-palette submodule tracking the latest commit on its
# main branch. Run automatically by suckless/dwm's `make install`, so Alt+Shift+P
# always points at whatever's newest without any manual submodule dance.
set -euo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")/.."

git submodule update --init --remote --merge -- scripts/rofi-command-palette

if ! command -v yq >/dev/null 2>&1; then
	echo "warning: yq is not installed - rofi-command-palette needs it (sudo dnf install yq)" >&2
fi
