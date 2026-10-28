#!/bin/sh
# Explicit, opt-in global Pi package installation. No agent bundle is installed.
set -eu
command -v pi >/dev/null 2>&1 || { echo 'Install Pi first.' >&2; exit 1; }
pi install npm:@injaneity/pi-computer-use
pi install npm:@amaster.ai/pi-browser-use
pi install npm:@lokeraar/pi-opendesign-bridge
pi install npm:@pi-plugins/claude-cli
pi install git:github.com/eiei114/pi-claude-tool-schema
pi install npm:pi-web-access
pi install npm:@howaboua/pi-codex-conversion
pi install npm:@howaboua/pi-codex-imagegen
