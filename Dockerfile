FROM runpod/worker-comfyui:5.8.5-base
WORKDIR /comfyui

RUN apt-get update && apt-get install -y aria2 libgl1 libglib2.0-0 && rm -rf /var/lib/apt/lists/*

# Custom nodes
RUN cd /comfyui/custom_nodes && \
    git clone https://github.com/chrisgoringe/cg-use-everywhere.git

RUN cd /comfyui/custom_nodes && \
    git clone https://github.com/cubiq/ComfyUI_IPAdapter_plus.git && \
    cd ComfyUI_IPAdapter_plus && \
    /opt/venv/bin/pip install -r requirements.txt

RUN cd /comfyui/custom_nodes && \
    git clone https://github.com/Acly/comfyui-tooling-nodes.git

# Core deps + InsightFace (required for FaceID)
RUN /opt/venv/bin/pip install --no-cache-dir \
    accelerate \
    xformers \
    insightface \
    onnxruntime-gpu \
    opencv-python-headless \
    || true

COPY extra_model_paths.yaml /comfyui/extra_model_paths.yaml
