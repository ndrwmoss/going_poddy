FROM runpod/pytorch:1.0.2-cu1281-torch280-ubuntu2404

WORKDIR /
COPY . .
ENV COMFY=/workspace/ComfyUI
ENV COMFY_WORKFLOW=$COMFY/user/default/workflows
ENV PODDY=/workspace/going_poddy
ENV PORTA_PODDY=/workspace/going_poddy/porta_poddy
ENV PREINSTALL="none"
ENV REPO="none"
ENV HF_HOME=/workspace/.cache/huggingface HF_DATASETS_CACHE=/workspace/.cache/huggingface/datasets/ DEFAULT_HF_METRICS_CACHE=/workspace/.cache/huggingface/metrics/ DEFAULT_HF_MODULES_CACHE=/workspace/.cache/huggingface/modules/ HUGGINGFACE_HUB_CACHE=/workspace/.cache/huggingface/hub/ HUGGINGFACE_ASSETS_CACHE=/workspace/.cache/huggingface/assets/ VIRTUALENV_OVERRIDE_APP_DATA=/workspace/.cache/virtualenv/ PIP_CACHE_DIR=/workspace/.cache/pip/ UV_CACHE_DIR=/workspace/.cache/uv/ HF_HUB_ENABLE_HF_TRANSFER=1 TRANSFORMERS_CACHE=/workspace/.cache/huggingface/transformers AI_TOOLKIT_AUTH=password NODE_ENV=production

RUN pip install --no-cache-dir pyloudnorm opencv-python imageio imageio-ffmpeg ffmpeg-python av runpod hf-transfer huggingface_hub diffusers accelerate insightface face-alignment onnxruntime-gpu comfy-cli packaging pyyaml ninja
RUN mkdir -p $COMFY

WORKDIR /
# SET FOLDERS
COPY boot/assets/ /usr/share/nginx/html/assets/
COPY boot/nginx.conf /etc/nginx/nginx.conf
COPY boot/scripts/ /scripts/
COPY boot/wheels/ /wheels/
COPY poddy /poddy
COPY initiation /initiation
COPY boot $PODDY/boot
COPY cmd $PODDY/cmd
COPY installers $PODDY/installers
COPY workflows $PODDY/workflows
COPY active $PODDY/active


# SET EXECUTABLES
RUN chmod +x /poddy
RUN chmod -R +x $PODDY/boot
RUN chmod -R +x $PODDY/cmd
RUN chmod -R +x $PODDY/installers
RUN chmod -R +x /scripts

EXPOSE 8080 8188 8888
CMD [ "/initiation" ]