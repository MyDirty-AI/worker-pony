#!/bin/bash
echo "=== Linking insightface ==="
mkdir -p /root/.insightface/models
ln -sf /runpod-volume/models/insightface/models/antelopev2 \
    /root/.insightface/models/antelopev2
echo "✅ antelopev2 linked"
