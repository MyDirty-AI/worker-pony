#!/bin/bash
set -e

# Debug — print Python env at runtime
echo "=== Python path ==="
which python3
echo "=== Venv python ==="
/opt/venv/bin/python --version
echo "=== insightface check ==="
/opt/venv/bin/python -c "import insightface; print('insightface OK:', insightface.__version__)" || echo "insightface MISSING in venv"
echo "=== sys.path ==="
/opt/venv/bin/python -c "import sys; print(sys.path)"

VOLUME="/runpod-volume"
COMFY="/comfyui"

for FOLDER in checkpoints loras ipadapter clip_vision vae insightface; do
    SRC="$VOLUME/models/$FOLDER"
    DST="$COMFY/models/$FOLDER"
    if [ -d "$SRC" ]; then
        rm -rf "$DST"
        ln -s "$SRC" "$DST"
    fi
done

exec python -u /start.py
