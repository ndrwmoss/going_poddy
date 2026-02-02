FROM jnxmx/comfy25:new128
WORKDIR /
COPY . .
COPY boot_poddy.sh /
RUN chmod +x /boot_poddy.sh
COPY update_poddy.sh /
RUN chmod +x /update_poddy.sh
EXPOSE 8188 8288 8888
CMD [ "/boot_poddy.sh" ]