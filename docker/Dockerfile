FROM jnxmx/comfy25:new128
WORKDIR /
COPY . .
RUN pip3 install nicegui && \
    apt-get install jq
COPY init.sh /
COPY status /
RUN chmod +x /init.sh && \
    chmod +x /update.sh
CMD [ "/init.sh" ]
