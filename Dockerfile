FROM runpod/worker-comfyui:5.8.5-base
WORKDIR /comfyui

RUN apt-get update && apt-get install -y \
    aria2 libgl1 libglib2.0-0 \
    python3-dev build-essential cmake git \
    && rm -rf /var/lib/apt/lists/*

RUN cd /comfyui/custom_nodes && \
    git clone https://github.com/chrisgoringe/cg-use-everywhere.git

RUN cd /comfyui/custom_nodes && \
    git clone https://github.com/cubiq/ComfyUI_IPAdapter_plus.git

RUN cd /comfyui/custom_nodes && \
    git clone https://github.com/Acly/comfyui-tooling-nodes.git

RUN /opt/venv/bin/pip install --no-cache-dir accelerate xformers

RUN /opt/venv/bin/pip install --no-cache-dir cython numpy && \
    git clone https://github.com/deepinsight/insightface.git /tmp/insightface && \
    cd /tmp/insightface/python-package && \
    /opt/venv/bin/pip install --no-cache-dir . && \
    rm -rf /tmp/insightface

RUN /opt/venv/bin/pip install --no-cache-dir \
    onnxruntime-gpu \
    opencv-python-headless

COPY extra_model_paths.yaml /comfyui/extra_model_paths.yaml
