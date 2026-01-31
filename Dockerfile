FROM jnxmx/comfy25:new128
WORKDIR /
COPY . .
COPY init.sh /
COPY update_poddy.sh /
RUN chmod +x /init.sh
RUN chmod +x /update_poddy.sh
EXPOSE 8188 8288 8888
CMD [ "/init.sh" ]