FROM jnxmx/comfy25:new128
WORKDIR /
COPY . .
RUN pip3 install nicegui
COPY init.sh /
RUN chmod +x /init.sh
EXPOSE 8188 8288 8888
CMD [ "/init.sh" ]