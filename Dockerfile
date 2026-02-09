FROM jnxmx/comfy25:new128
WORKDIR /
COPY . .

# CREATE VARIABLES
ENV COMFY=/workspace/ComfyUI
ENV COMFY_WORKFLOW=$COMFY/user/default/workflows
ENV PODDY=/going_poddy
ENV PORTA_PODDY=$PODDY/porta_poddy
ENV GIT_ADDRESS="https://github.com/ndrwmoss/going_poddy"
ENV PREINSTALL="none"
ENV CIVITAI="none"

# MOVE COMFY
RUN mv /Comfy $COMFY

# MAKE PODDY DIRECTORY
RUN mkdir -p $PODDY/active/package
RUN mkdir -p $PODDY/active/model
RUN mkdir -p $PODDY/active/apt
RUN mkdir -p $PODDY/active/py
RUN mkdir -p $PODDY/active/node
RUN mkdir -p $PODDY/active/tmp

# INSTALL PODDY
COPY poddy /poddy
RUN chmod +x /poddy
COPY update_poddy /update_poddy
RUN chmod +x /update_poddy

# SET FOLDERS
COPY boot $PODDY/active
COPY boot $PODDY/boot
COPY cmd $PODDY/cmd
COPY installers $PODDY/installers
COPY workflows $PODDY/workflows

# SET EXECUTABLES
RUN chmod -R +x $PODDY/boot
RUN chmod -R +x $PODDY/cmd
RUN chmod -R +x $PODDY/installers

EXPOSE 8188 8288 8888
CMD [ "/going_poddy/boot/init" ]