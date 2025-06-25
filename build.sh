#!/usr/bin/env bash
set -euo pipefail

PKG_NAME="fliplight"
PKG_VER=$(jq -r '.version' manifest.json)
OUT_DIR="$PWD/web-ext-artifacts"
mkdir -p "$OUT_DIR"
OUT_FILE="${OUT_DIR}/${PKG_NAME}-${PKG_VER}.xpi"

echo "📦 Building $OUT_FILE …"

zip -r "$OUT_FILE" \
  manifest.json \
  popup.html \
  popup.js \
  icons/

echo "✅ Done → $OUT_FILE"
