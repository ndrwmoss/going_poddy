# Going Poddy
A CUDA 12.8, ComfyUI, Sage Attention Runpod pod with quick installs for various multimedia workflows. Like most people I don't own a graphics card that costs more than my car so runpod is my platform of choice for a la cart AI processing power. I may only need the pod for 10 minutes, I may need it a few hours, so it's not really efficient to make them an API, nor is it truly efficient to do long term storage on a pod due to the random nature of my use and the wait for pods in specific clusters to become available, so I choose to just deploy a new pod everytime I need one. That's where this image and the installers come in: I don't need to manually redownload everything every single time I deploy, I just type in a single command and almost everything happens under the hood and only takes between 5-10 minutes (depends on the package's models size and server bandwidth/cpu lottery) to get into Comfy and actually working. The workflows included are ones that I've found use for in my own multimedia projects, so others may be able to find use as well. I provide a link to the original source of the workflow below, click the link to learn how to use the workflow. Realize each of these workflows has probably been slightly edited, mainly changing models so I'm not downloading a ton of variants of the same model. For my models I choose a medium to medium high quality variant, depending on the model in question, I find this to generally be the point of the economic curve where the quality of the results matches the price of the processing.

## Install

The pod installs a simple image, after boot the image downloads any package(s) (workflows + custom nodes + models) you choose, simply type in ``/poddy install ``  followed by an install command (found below) into the terminal, or add the install command(s) to the Pod Configuration under PREINSTALL on the pod deployment page for a seemless install. To uninstall a package do the same thing but replace ``install`` with ``uninstall``. The pod automatically updates the going_poddy workflows and installers on start but you can also manually do it by typing ``/poddy update ``.


##
### Base Container Size: 11 GB
### Base Container DL/Install time: ~3-5 minutes depending on server lottery.
##
# Video




##
# Photo
### Epic Realism
<mark>disk space: **35 GB**</mark>  
<mark>dl/install time: **2-5 minutes**</mark>  

    /poddy i epic_realism

juggernaut_hair_transfer by [Stable Hair II](https://github.com/lldacing/ComfyUI_StableHair_ll/blob/main/README_EN.md)  
All workflow prefixed by juggernaut_pix are by [pixaroma](https://www.youtube.com/watch?v=qLZJ7iSq9tY)

### Juggernaut
<mark>disk space: **35 GB**</mark>  
<mark>dl/install time: **2-5 minutes**</mark>  

    /poddy i juggernaut

juggernaut_hair_transfer by [Stable Hair II](https://github.com/lldacing/ComfyUI_StableHair_ll/blob/main/README_EN.md)  
All workflow prefixed by juggernaut_pix are by [pixaroma](https://www.youtube.com/watch?v=qLZJ7iSq9tY)

### Flux Fill
<mark>disk space: **35 GB**</mark>  
<mark>dl/install time: **2-5 minutes**</mark>  

    /poddy i flux_fill

All workflow prefixed by flux_fill_pix are by [pixaroma](https://www.youtube.com/watch?v=qLZJ7iSq9tY)


#### QWEN Edit
<mark>disk space: **base container size + 35 GB**</mark>  
All workflows prefixed by QIE_pix are by [pixaroma](https://www.youtube.com/watch?v=myuV6vjkGIw)  
All workflows prefixed by QIE_fab are by [Faboro Hacks](https://www.youtube.com/watch?v=_QYBgeII9Pg)  
All workflows prefixed by QIE_apex are by [Apex Artist](https://www.youtube.com/watch?v=v6xOY5x4NFU)  
All workflows prefixed by QIE_lla are by [Llamabytes](https://www.youtube.com/watch?v=YBhYAVUfPvg)  
All workflows prefixed by QIE_ali are by [Alissonerdx](https://huggingface.co/Alissonerdx/BFS-Best-Face-Swap)  
QIE_clothing_extract and QIE_clothing_transfer are by [Clothes Try On](https://civitai.com/models/1940532/clothes-try-on-clothing-transfer-qwen-edit)  
 
    /poddy i qwen_edit

