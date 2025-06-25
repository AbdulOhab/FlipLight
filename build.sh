#!/usr/bin/env bash
set -euo pipefail

PKG_NAME="fliplight"
if command -v jq >/dev/null; then
  PKG_NAME=$(jq -r '.name' manifest.json | tr '[:upper:]' '[:lower:]' | tr ' ' '-')
  PKG_VER=$(jq -r '.version' manifest.json)
else
  PKG_VER=$(grep -oP '"version"\s*:\s*"\K[^"]+' manifest.json)
fi
OUT_FILE="${PKG_NAME}-${PKG_VER}.xpi"
EXCLUDES=(-x "*.xpi" -x "build.sh" -x ".git/*")
echo "📦 Building $OUT_FILE …"
zip -qr "$OUT_FILE" . "${EXCLUDES[@]}"
echo "✅ Done → $OUT_FILE"
