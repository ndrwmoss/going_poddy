FROM jnxmx/comfy25:new128
WORKDIR /
COPY . .
RUN apt-get install jq
COPY init.sh /
RUN chmod +x /init.sh
COPY update_poddy.sh /
RUN chmod +x /update_poddy.sh
COPY poddy_state.json /
LABEL version="1.0"
EXPOSE 8188 8288 8888
CMD [ "/init.sh" ]