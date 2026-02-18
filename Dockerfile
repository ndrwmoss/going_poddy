FROM jnxmx/comfy25:new128
WORKDIR /
COPY . .
RUN mv Comfy /workspace/ComfyUI
# CREATE VARIABLES
ENV COMFY=/workspace/ComfyUI
ENV COMFY_WORKFLOW=$COMFY/user/default/workflows
ENV PODDY=/workspace/going_poddy
ENV PORTA_PODDY=/workspace/going_poddy/porta_poddy
ENV PREINSTALL="none"
# ENV CIVITAI_API_TOKEN="none"
# ENV HF_API_TOKEN="none"
ENV REPO="none"

# INSTALL PODDY
COPY poddy /poddy
RUN chmod +x /poddy

# SET FOLDERS
COPY boot $PODDY/boot
COPY cmd $PODDY/cmd
COPY installers $PODDY/installers
COPY workflows $PODDY/workflows
COPY active $PODDY/active

# SET EXECUTABLES
RUN chmod -R +x $PODDY/boot
RUN chmod -R +x $PODDY/cmd
RUN chmod -R +x $PODDY/installers

EXPOSE 8080 8188 8888
CMD [ "/workspace/going_poddy/boot/init" ]