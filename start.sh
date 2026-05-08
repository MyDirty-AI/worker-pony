#!/bin/bash
set -e

echo "=== Linking insightface ==="
mkdir -p /root/.insightface/models
ln -sf /runpod-volume/models/insightface/models/antelopev2 \
    /root/.insightface/models/antelopev2
echo "✅ antelopev2 linked"

echo "=== Starting ComfyUI worker ==="
exec python -u /start.py
