#!/bin/bash
mkdir -p /comfyui/models/insightface/models
ln -sf /runpod-volume/models/insightface/models/antelopev2 \
    /comfyui/models/insightface/models/antelopev2
echo "✅ insightface linked"
