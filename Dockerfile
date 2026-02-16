FROM runpod/pytorch:1.0.2-cu1281-torch280-ubuntu2404
WORKDIR /
COPY . .

# CREATE VARIABLES
ENV COMFY=/workspace/ComfyUI
ENV COMFY_WORKFLOW=$COMFY/user/default/workflows
ENV PODDY=/going_poddy
ENV PORTA_PODDY=$PODDY/porta_poddy
ENV PREINSTALL="none"
ENV CIVITAI_API_TOKEN="none"
ENV HF_API_TOKEN="none"
ENV REPO="none"

RUN mkdir -p /workspace
RUN apt install python3 git ffmpeg
RUN pip install comfy-cli
RUN comfy --workspace=/workspace/ install -y
RUN cd /workspace/ComfyUI/custom_nodes
RUN git clone https://github.com/mit-han-lab/ComfyUI-nunchaku nunchaku_nodes
RUN cd nunchaku_nodes
RUN pip install -r requirements.txt

# INSTALL PODDY
COPY poddy /poddy
RUN chmod +x /poddy

# INSTALL STARTUP
COPY poddy_starter /poddy_starter
RUN chmod +x /poddy_starter

# SET FOLDERS
COPY boot $PODDY/boot
COPY installers $PODDY/installers
COPY workflows $PODDY/workflows
COPY active $PODDY/active
COPY cmd $PODDY/cmd
COPY tmp $PODDY/tmp

# SET EXECUTABLES
RUN chmod -R +x $PODDY/boot
RUN chmod -R +x $PODDY/cmd

EXPOSE 8080 8188 8888
CMD [ "/poddy_starter" ]