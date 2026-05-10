FROM runpod/worker-comfyui:5.8.5-base
WORKDIR /comfyui
RUN apt-get update && apt-get install -y aria2 && rm -rf /var/lib/apt/lists/*
RUN cd /comfyui/custom_nodes && \
    git clone https://github.com/chrisgoringe/cg-use-everywhere.git
RUN cd /comfyui/custom_nodes && \
    git clone https://github.com/cubiq/ComfyUI_IPAdapter_plus.git && \
    cd ComfyUI_IPAdapter_plus && /opt/venv/bin/pip install -r requirements.txt || true
RUN cd /comfyui/custom_nodes && \
    git clone https://github.com/cubiq/ComfyUI_InstantID.git && \
    cd ComfyUI_InstantID && /opt/venv/bin/pip install -r requirements.txt || true
RUN cd /comfyui/custom_nodes && \
    git clone https://github.com/Acly/comfyui-tooling-nodes.git
RUN /opt/venv/bin/pip install insightface==0.7.3 onnxruntime-gpu==1.16.3 --force-reinstall || true
COPY extra_model_paths.yaml /comfyui/extra_model_paths.yaml
