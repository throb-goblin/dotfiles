#!/bin/bash
# Optional: run on a Microsoft Surface Pro 7 to add touchscreen device mapping.
# Maps the Surface touchscreen to eDP-1 for correct HiDPI coordinate alignment.
set -e

INPUT_CONF="$HOME/.config/hypr/input.conf"

if grep -q "ipts-045e:099f-touchscreen" "$INPUT_CONF" 2>/dev/null; then
    echo "Surface touchscreen mapping already present in $INPUT_CONF, skipping."
    exit 0
fi

cat >> "$INPUT_CONF" <<'EOF'

# Map touchscreen to the correct output for proper HiDPI coordinate alignment
device {
  name = ipts-045e:099f-touchscreen
  output = eDP-1
}
EOF

echo "Surface touchscreen mapping added to $INPUT_CONF."
echo "Hyprland will auto-reload the config."
