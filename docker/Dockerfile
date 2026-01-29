FROM jnxmx/comfy25:new128
WORKDIR /
COPY . .
COPY init.sh /
COPY update.sh /
COPY installed.json /
RUN apt-get install jq && \
    chmod +x /init.sh && \
    chmod +x /update.sh
CMD [ "/init.sh" ]
