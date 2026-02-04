FROM jnxmx/comfy25:new128
WORKDIR /
COPY . .
ENV COMFY=/workspace/ComfyUI
ENV COMFY_WORKFLOW=$COMFY/user/default/workflows
ENV PODDY=/gpoddy
ENV PODDY_ACTIVE=$PODDY/active
ENV PODDY_CMD=$PODDY/cmd
ENV PODDY_WORKFLOWS=$PODDY/workflows
ENV PORTA_PODDY=$PODDY/porta_poddy
ENV GIT_ADDRESS="https://github.com/ndrwmoss/going_poddy"
ENV PREINSTALL="none"

# MAKE PODDY DIRECTORY
RUN mkdir -p $PORTA_PODDY
RUN mkdir -p $PODDY_ACTIVE/models
RUN mkdir -p $PODDY_ACTIVE/custom_nodes
RUN mkdir -p $PODDY_ACTIVE/workflows
RUN mkdir -p $PODDY_ACTIVE/py

# INSTALL PODDY
COPY boot $PODDY/boot
COPY cmd $PODDY/cmd
COPY workflows $PODDY/workflows
COPY poddy /poddy

# SET EXECUTABLES
RUN chmod -R +x $PODDY/boot
RUN chmod -R +x $PODDY/cmd
RUN find $PODDY/workflows -type f -name "*.install" -exec chmod +x {} +
RUN chmod +x /poddy

# ENV PATH="/poddy:${PATH}"
EXPOSE 8188 8288 8888
CMD [ "/gpoddy/boot/init" ]