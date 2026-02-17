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
##
# Video

### Character Replace
The workflow is by [MDMZ](https://www.youtube.com/watch?v=woCP1Q_Htwo), information about how to use the workflow can be found by watching the video in the link.  
<mark>disk space: **base container size + 35 GB**</mark>    

    /poddy i vid_character_replace

### Lipsync
The workflow is by [Blue Spork](https://www.youtube.com/watch?v=LR4lBimS7O4), information about how to use the workflow can be found by watching the video in the link.  
<mark>disk space: **base container size + 35 GB**</mark>   

    /poddy i vid_lipsync

### Upscale
<mark>disk space: **base container size + 35 GB**</mark>   

    /poddy i vid_upscale

##
# Photo
### Clothing Transfer
<mark>disk space: **base container size + 35 GB**</mark>    

    /poddy i img_clothing_transfer

### Upscale
<mark>disk space: **base container size + 35 GB**</mark>      

    /poddy i img_upscale
