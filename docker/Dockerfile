FROM jnxmx/comfy25:new128
WORKDIR /
COPY . .
COPY init.sh /
COPY update_comfy.sh /
COPY installed.json /
RUN apt-get install jq && \
    chmod +x /init.sh && \
    chmod +x /update_comfy.sh
CMD [ "/init.sh" ]
