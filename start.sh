for FOLDER in checkpoints loras ipadapter clip_vision vae insightface; do
    SRC="$VOLUME/models/$FOLDER"
    DST="$COMFY/models/$FOLDER"
    if [ -d "$SRC" ]; then
        rm -rf "$DST"
        ln -s "$SRC" "$DST"
    fi
done
