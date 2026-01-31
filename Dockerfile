FROM jnxmx/comfy25:new128
WORKDIR /
COPY . .
RUN pip3 install nicegui
COPY init.sh /
COPY state.json /
COPY resources.json /
RUN chmod +x /init.sh
CMD [ "/init.sh" ]