#!/bin/bash

# === Configuration ===
OUTPUT_DIR="web-ext-artifacts"
ZIP_NAME="fliplight-addon.zip"
TEMP_DIR="fliplight-build"

# === Clean Previous Builds ===
rm -rf "$TEMP_DIR"
mkdir -p "$TEMP_DIR"
mkdir -p "$OUTPUT_DIR"

# === Files/Folders to Include ===
INCLUDE_ITEMS=(
  manifest.json
  popup.html
  popup.js
  background.js
  style.css
  icons
)

# === Copy Files ===
for item in "${INCLUDE_ITEMS[@]}"; do
  if [ -e "$item" ]; then
    cp -r "$item" "$TEMP_DIR/"
  else
    echo "⚠️ Warning: $item not found, skipping."
  fi
done

# === Create ZIP ===
cd "$TEMP_DIR" || exit
zip -r "../$OUTPUT_DIR/$ZIP_NAME" . > /dev/null
cd ..

# === Cleanup ===
rm -rf "$TEMP_DIR"

# === Done ===
echo "✅ Extension built successfully: $OUTPUT_DIR/$ZIP_NAME"
