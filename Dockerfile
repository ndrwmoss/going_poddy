FROM jnxmx/comfy25:new128
WORKDIR /
COPY . .
ENV COMFY=/workspace/ComfyUI
ENV COMFY_WORKFLOW=$COMFY/user/default/workflows
ENV PODDY=/going_poddy
ENV PODDY_CMD=$PODDY/cmd
ENV PODDY_WORKFLOWS=$PODDY/workflows
ENV PORTA_PODDY=$PODDY/going_poddy
ENV GIT_ADDRESS="https://github.com/ndrwmoss/going_poddy"
ENV PREINSTALL="none"
ENV CIVITAI="none"
RUN mv /Comfy $COMFY
# MAKE PODDY DIRECTORY
RUN mkdir -p $PODDY

# INSTALL PODDY
COPY update_poddy /update_poddy
RUN chmod +x /update_poddy
COPY poddy /poddy
RUN chmod +x /poddy
COPY boot $PODDY/boot
COPY cmd $PODDY/cmd
COPY installers $PODDY/installers
COPY workflows $PODDY/workflows

# SET EXECUTABLES
RUN chmod -R +x $PODDY/boot
RUN chmod -R +x $PODDY/cmd
RUN chmod -R +x $PODDY/installers


# ENV PATH="/poddy:${PATH}"
EXPOSE 8188 8288 8888
CMD [ "/going_poddy/boot/init" ]