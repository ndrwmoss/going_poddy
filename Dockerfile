FROM jnxmx/comfy25:new128
WORKDIR /
COPY . .
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
WORKDIR /Comfy/custom_nodes
RUN cd /Comfy/custom_nodes &&\
git clone https://github.com/1038lab/ComfyUI-RMBG.git &&\
git clone https://github.com/djbielejeski/a-person-mask-generator.git &&\
git clone https://github.com/SeanScripts/ComfyUI-Unload-Model.git &&\
git clone https://github.com/quasiblob/ComfyUI-EsesImageCompare.git &&\
git clone https://github.com/kijai/ComfyUI-MelBandRoFormer.git &&\
git clone https://github.com/kijai/ComfyUI-WanAnimatePreprocess.git &&\
git clone https://github.com/kijai/ComfyUI-segment-anything-2.git &&\
git clone https://github.com/kijai/ComfyUI-WanVideoWrapper.git &&\
git clone https://github.com/kijai/ComfyUI-Florence2.git &&\
git clone https://github.com/kael558/ComfyUI-GGUF-FantasyTalking.git &&\
git clone https://github.com/Yanick112/ComfyUI-ToSVG.git &&\
git clone https://github.com/StableLlama/ComfyUI-basic_data_handling.git &&\
git clone https://github.com/jomakaze/ComfyUI_JomaNodes.git &&\
git clone https://github.com/aining2022/ComfyUI_Swwan.git &&\
git clone https://github.com/mickmumpitz/ComfyUI-Mickmumpitz-Nodes.git &&\
git clone https://github.com/ruucm/ruucm-comfy.git &&\
git clone https://github.com/Polygoningenieur/ComfyUI-IC-Light-Video.git &&\
git clone https://github.com/amtarr/ComfyUI-TextureAlchemy.git &&\
git clone https://github.com/licyk/ComfyUI-HakuImg.git &&\
git clone https://github.com/risunobushi/comfyUI_FrequencySeparation_RGB-HSV.git &&\
git clone https://github.com/M1kep/ComfyLiterals.git &&\
git clone https://github.com/jamesWalker55/comfyui-various.git &&\
git clone https://github.com/EllangoK/ComfyUI-post-processing-nodes.git &&\
git clone https://github.com/BadCafeCode/masquerade-nodes-comfyui.git &&\
git clone https://github.com/cubiq/ComfyUI_FaceAnalysis.git &&\
git clone https://github.com/kijai/ComfyUI-IC-Light.git &&\
git clone https://github.com/ltdrdata/ComfyUI-Impact-Pack.git &&\
git clone https://github.com/cubiq/ComfyUI_IPAdapter_plus.git &&\
git clone https://github.com/calcuis/gguf.git &&\
git clone https://github.com/kijai/ComfyUI-DepthAnythingV2.git &&\
git clone https://github.com/un-seen/comfyui-tensorops.git &&\
git clone https://github.com/lquesada/ComfyUI-Inpaint-CropAndStitch.git &&\
git clone https://github.com/gseth/ControlAltAI-Nodes.git &&\
git clone https://github.com/vantagewithai/Vantage-Nodes.git &&\
git clone https://github.com/rgthree/rgthree-comfy.git &&\
git clone https://github.com/yolain/ComfyUI-Easy-Use.git &&\
git clone https://github.com/Smirnov75/ComfyUI-mxToolkit.git &&\
git clone https://github.com/ltdrdata/was-node-suite-comfyui.git &&\
git clone https://github.com/a-und-b/ComfyUI_LoRA_from_URL.git &&\
git clone https://github.com/lldacing/ComfyUI_StableHair_ll.git &&\
git clone https://github.com/cubiq/ComfyUI_essentials.git &&\
git clone https://github.com/mav-rik/facerestore_cf.git &&\
git clone https://github.com/ryanontheinside/ComfyUI_RyanOnTheInside.git

WORKDIR /

RUN mv Comfy /workspace/ComfyUI

EXPOSE 8080 8188 8888
CMD [ "/workspace/going_poddy/boot/init" ]