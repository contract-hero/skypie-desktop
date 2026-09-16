#!/usr/bin/env bash
# Build a production-ready Sky Pie.app bundle for macOS.
#
# Output: target/release/bundle/macos/Sky Pie.app
# Install: cp -R target/release/bundle/macos/Sky Pie.app /Applications/

set -euo pipefail

cd "$(dirname "$0")/.."

if ! command -v pnpm >/dev/null 2>&1; then
  echo "pnpm not found. Install via: npm install -g pnpm" >&2
  exit 1
fi

if ! command -v cargo >/dev/null 2>&1; then
  echo "cargo not found. Install via: https://rustup.rs/" >&2
  exit 1
fi

echo "==> Installing JS deps"
pnpm install

echo "==> Building Sky Pie.app (this takes a few minutes on first run)"
pnpm tauri build

APP_PATH="target/release/bundle/macos/Sky Pie.app"
if [ ! -d "$APP_PATH" ]; then
  echo "Build finished but $APP_PATH not found." >&2
  exit 1
fi

echo
echo "==> Built: $APP_PATH"
echo
echo "To install:"
echo "    cp -R $APP_PATH /Applications/"
echo
echo "First launch from /Applications/ will prompt Gatekeeper (right-click → Open)."
