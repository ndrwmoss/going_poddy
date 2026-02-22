FROM jnxmx/comfy25:new128
WORKDIR /
COPY . .
RUN mv Comfy /workspace/ComfyUI
# CREATE VARIABLES
ENV COMFY=/workspace/ComfyUI
ENV COMFY_WORKFLOW=$COMFY/user/default/workflows
ENV PODDY=/workspace/going_poddy
ENV PORTA_PODDY=/workspace/going_poddy/porta_poddy
ENV PREINSTALL="none"
ENV REPO="none"
# ENV CIVITAI_API_TOKEN="none"
# ENV HF_API_TOKEN="none"

# INSTALL PODDY
COPY poddy /poddy
RUN chmod +x /poddy

# SET FOLDERS
COPY boot $PODDY/boot
COPY cmd $PODDY/cmd
COPY installers $PODDY/installers
COPY workflows $PODDY/workflows
COPY active $PODDY/active

# SET EXECUTABLES
RUN chmod -R +x $PODDY/boot
RUN chmod -R +x $PODDY/cmd
RUN chmod -R +x $PODDY/installers

RUN cd /workspace/ComfyUI/custom_nodes
RUN git clone https://github.com/kijai/ComfyUI-WanVideoWrapper.git
RUN git clone https://github.com/kijai/ComfyUI-Florence2.git
RUN git clone https://github.com/kael558/ComfyUI-GGUF-FantasyTalking.git
RUN git clone https://github.com/Yanick112/ComfyUI-ToSVG.git
RUN git clone https://github.com/StableLlama/ComfyUI-basic_data_handling.git
RUN git clone https://github.com/jomakaze/ComfyUI_JomaNodes.git
RUN git clone https://github.com/aining2022/ComfyUI_Swwan.git
RUN git clone https://github.com/mickmumpitz/ComfyUI-Mickmumpitz-Nodes.git
RUN git clone https://github.com/ruucm/ruucm-comfy.git
RUN git clone https://github.com/Polygoningenieur/ComfyUI-IC-Light-Video.git
RUN git clone https://github.com/amtarr/ComfyUI-TextureAlchemy.git
RUN git clone https://github.com/licyk/ComfyUI-HakuImg.git
RUN git clone https://github.com/risunobushi/comfyUI_FrequencySeparation_RGB-HSV.git
RUN git clone https://github.com/M1kep/ComfyLiterals.git
RUN git clone https://github.com/jamesWalker55/comfyui-various.git
RUN git clone https://github.com/EllangoK/ComfyUI-post-processing-nodes.git
RUN git clone https://github.com/BadCafeCode/masquerade-nodes-comfyui.git
RUN git clone https://github.com/cubiq/ComfyUI_FaceAnalysis.git
RUN git clone https://github.com/kijai/ComfyUI-IC-Light.git
RUN git clone https://github.com/ltdrdata/ComfyUI-Impact-Pack.git
RUN git clone https://github.com/cubiq/ComfyUI_IPAdapter_plus.git
RUN git clone https://github.com/calcuis/gguf.git
RUN git clone https://github.com/kijai/ComfyUI-DepthAnythingV2.git
RUN git clone https://github.com/Fannovel16/comfyui_controlnet_aux.git
RUN git clone https://github.com/lquesada/ComfyUI-Inpaint-CropAndStitch.git
RUN git clone https://github.com/gseth/ControlAltAI-Nodes.git
RUN git clone https://github.com/city96/ComfyUI-GGUF.git
RUN git clone https://github.com/vantagewithai/Vantage-Nodes.git
RUN git clone https://github.com/rgthree/rgthree-comfy.git
RUN git clone https://github.com/yolain/ComfyUI-Easy-Use.git
RUN git clone https://github.com/kijai/ComfyUI-KJNodes.git
RUN git clone https://github.com/ssitu/ComfyUI_UltimateSDUpscale.git
RUN git clone https://github.com/Smirnov75/ComfyUI-mxToolkit.git
RUN git clone https://github.com/ltdrdata/was-node-suite-comfyui.git
RUN git clone https://github.com/a-und-b/ComfyUI_LoRA_from_URL.git
RUN git clone https://github.com/lldacing/ComfyUI_StableHair_ll.git
RUN git clone https://github.com/cubiq/ComfyUI_essentials.git
RUN git clone https://github.com/mav-rik/facerestore_cf.git
RUN git clone https://github.com/Kosinkadink/ComfyUI-VideoHelperSuite.git
RUN git clone https://github.com/ryanontheinside/ComfyUI_RyanOnTheInside.git
RUN git clone https://github.com/kijai/ComfyUI-MelBandRoFormer.git
RUN git clone https://github.com/kijai/ComfyUI-WanVideoWrapper.git
RUN git clone https://github.com/kijai/ComfyUI-WanAnimatePreprocess.git
RUN git clone https://github.com/kijai/ComfyUI-segment-anything-2.git
RUN git clone https://github.com/un-seen/comfyui-tensorops.git

EXPOSE 8080 8188 8888
CMD [ "/workspace/going_poddy/boot/init" ]