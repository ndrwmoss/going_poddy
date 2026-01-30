FROM jnxmx/comfy25:new128
WORKDIR /
COPY . .
COPY update.sh /
COPY init.sh /
COPY status /
RUN chmod +x /init.sh && \
    chmod +x /update.sh
RUN pip3 install nicegui && \
    apt-get install jq
CMD [ "/init.sh" ]
