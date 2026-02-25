# Going Poddy
A CUDA 12.8, ComfyUI, Sage Attention Runpod pod with quick installs for Wan 2.2, SDXL, Flux, Qwen, Trellis, and other models. When you configure the pod, put in one of the packages below in the PREINSTALL variable and it'll download all the necessary models, nodes, possible python installs, and workflows to get you up and running your projects as quick as possible. Workflows have model sizes meant for 24GB to 32GB RAM Nvidia cards (and double the card's RAM in system RAM). The base container is ~11GB, each package has different models so they will take up different overall containers sizes, especially if installing mutltiple packages.

# Install

1. Go to the official [ComfyUI Sageattention Template (jnxmx/comfy25:new128)](https://console.runpod.io/hub/template/comfyui-sageattention?id=f4sahjc81c)  

2. Click **Configure Pod**.  

3. Choose the hardware options you want on the next page, when you've selected a GPU it will scroll the page down to...  

4. The **Configure Deployment** section has a button labelled <mark>Edit</mark>, click that button to open the **Pod Template Overrides** popup.  

5. Set your container disk to an appropriate size for the workflow you're trying to install, and set a volume disk if don't want to reinstall every boot.  

6. Go to <mark>Environmental Variables</mark> and add your civitai api key. If you want to preinstall a package before boot, add it under the PREINSTALL variable

7. Once the pod is open you can install a new package at runtime by opening a terminal and typing:
    
    /poddy i package_name

8. You can uninstall a package by opening a terminal and typing :
    
    /poddy u package_name  

*note: uninstalling is brute force, there is no uninstaller list or dependency tracking. If two packages share the same models and you uninstall one the other package will not work, you'll need to reinstall it to re-download the dependencies (it will skip parts it kept though, yay tiny wins).
##
### Base Container Size: 11 GB
### Base Container DL/Install time: ~3-5 minutes depending on server lottery.
##
# Video




##
# Photo
### Hair Transfer
Based on [Stable Hair II](https://github.com/lldacing/ComfyUI_StableHair_ll/blob/main/README_EN.md)  
<mark>disk space: **base container size + 35 GB**</mark>  
<mark>dl/install time: **2-5 minutes**</mark>  
Transfers hair from one subject to another, meant for realism and may have problems with animation hair. Both images should be 512 x 512 pixels. Other sizes work but with much MUCH more error, if choosing to use a custom size the image dimensions must be divisible by 16. The workflow has 2 stages, one where it takes the subject getting their hair changed and makes them bald, the second stage removes the hair from the second subject and places it on the main subject's head. It make take several different seeds (play with CFG between 1.0-3.0 as well) to get the subject bald. When you've got the bald down, make sure to set seed changing to fixed, that way you can apply multiple different hairstyle without having to process the bald phase.

    /poddy i hair_transfer

#### QWEN Edit
The workflows are by 
All workflows prefixed by QIE are by [pixaroma](https://www.youtube.com/watch?v=myuV6vjkGIw)  
All workflows prefixed by faboro are by [Faboro Hacks](https://www.youtube.com/watch?v=_QYBgeII9Pg)  
All workflows prefixed by apex are by [Apex Artist](https://www.youtube.com/watch?v=v6xOY5x4NFU)  
All workflows prefixed by llama are by [Llamabytes](https://www.youtube.com/watch?v=YBhYAVUfPvg)  

<mark>disk space: **base container size + 35 GB**</mark>   

    /poddy i img_qwen_edit

#### Upscale
<mark>disk space: **base container size + 35 GB**</mark>      

    /poddy i img_flux_upscale

##
# Audio
### Ace Step 1.5
The workflows are by [RyanOnTheInside](https://www.youtube.com/watch?v=R6ksf5GSsrk).  
<mark>disk space: **base container size + 35 GB**</mark>   

    /poddy i aud_acestep