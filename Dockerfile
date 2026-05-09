FROM runpod/worker-comfyui:5.8.5-base
WORKDIR /comfyui

RUN apt-get update && apt-get install -y aria2 && rm -rf /var/lib/apt/lists/*

RUN cd /comfyui/custom_nodes && \
    git clone https://github.com/chrisgoringe/cg-use-everywhere.git

RUN cd /comfyui/custom_nodes && \
    git clone https://github.com/cubiq/ComfyUI_IPAdapter_plus.git

RUN cd /comfyui/custom_nodes && \
    git clone https://github.com/cubiq/ComfyUI_InstantID.git && \
    cd ComfyUI_InstantID && pip install -r requirements.txt || true

RUN cd /comfyui/custom_nodes && \
    git clone https://github.com/Acly/comfyui-tooling-nodes.git

RUN pip install insightface onnxruntime-gpu || true

RUN mkdir -p /comfyui/models/insightface/models && \
    ln -sf /runpod-volume/models/insightface/models/antelopev2 \
    /comfyui/models/insightface/models/antelopev2

COPY extra_model_paths.yaml /comfyui/extra_model_paths.yaml
