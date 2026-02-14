FROM jnxmx/comfy25:new128
WORKDIR /
COPY . .

# CREATE VARIABLES
ENV COMFY=/workspace/ComfyUI
ENV COMFY_WORKFLOW=$COMFY/user/default/workflows
ENV PODDY=/going_poddy
ENV PORTA_PODDY=$PODDY/porta_poddy
ENV PREINSTALL="none"
ENV CIVITAI="none"
ENV REPO="none"
# MOVE COMFY
RUN mv /Comfy $COMFY

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

EXPOSE 8188 8288 8888
CMD [ "/poddy_starter" ]