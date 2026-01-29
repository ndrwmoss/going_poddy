FROM jnxmx/comfy25:new128
WORKDIR /
RUN git clone https://github.com/ndrwmoss/going_poddy && \
    mv /going_poddy/install/utilities/init.sh && /init.sh \
    mv /going_poddy/install/utilities/update.sh && /update.sh \
    chmod +x /init.sh && \
    chmod +x /update.sh && \
    cd rm -r going_poddy
CMD [ "/init.sh" ]
