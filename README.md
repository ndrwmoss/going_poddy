# Going Poddy
A pod template for Runpod: Cuda 12.8 Nunchaku 1.3 Sage Attention ComfyUI preinstalled, with WAN 2.2, WAN ANIMATE 2.2, FLUX DEV.2, and QWEN IMAGE EDIT 2513 packages installed at your discretion.

## Install
Go to the official [ComfyUI Sageattention Template (jnxmx/comfy25:new128)](https://console.runpod.io/hub/template/comfyui-sageattention?id=f4sahjc81c). It will run right out of the package with Cuda, Nunchaku, Sage Attention, and ComfyUI already installed and ready to use, but if you want more in depth workflows installed that include models such as WAN, FLUX, and QWEN, then contiue below.  

### Preinstall Models  

1. Click **Configure Pod**.  

2. Choose the hardware options you want on the next page, when you've selected a GPU it will scroll the page down to...  

3. The **Configure Deployment** section has a button labelled <mark>Edit</mark>, click that button to open the **Pod Template Overrides** popup.  

4. Set your container disk to an appropriate size for the workflow you're trying to install, and set a volume disk if don't want to reinstall every boot.  

5. There are two environmental variables you'll want to set.  
    A. First set your CIVITAI api key. If you don't have one, log onto civitai, click the user icon in the top right corner of the page, and navigate to the gear icon (settings) at the bottom of the dropdown. This takes you to the settings page, near the bottom of the page is a section called "API Keys" and click "Add API key", give the key a name, click save, and copy the api key it generated. Go back to Runpod and paste that api key as a new secret and select that secret for the CIVITAI key in the pod's settings.  

    B. If you want any packages preinstalled when the pod boots add them under the PREINSTALL environmental key. The scripts to enter can be found below. You can install multiple packages using a space between the commands.

6. Scroll to the bottom of deployment page and click <mark>Deploy</mark>.  

### Install/Uninstall models after boot
If you want to **install** packages after the pod has been booted, open up a terminal and type:  

`/poddy install [space_sperated_list of_packages_to_install]`

If you want to **uninstall** packages after the pod has been booted, open up a terminal and type:  

`/poddy uninstall [space_sperated_list of_packages_to_uninstall]`


## Base Container Size: 11GB
## Workflows
### Video

#### Character Replace
The workflow is by [MDMZ](https://www.youtube.com/watch?v=woCP1Q_Htwo).  
<mark>**45 GB container, 24 GB vram, 50 GB ram**</mark>  

    /poddy vid_character_replace

#### Lipsync
The workflow is by [Blue Spork](https://www.youtube.com/watch?v=LR4lBimS7O4).  
<mark>**45 GB container, 24 GB vram, 50 GB ram**</mark>  

    /poddy add vid_lipsync

#### Upscale
<mark>**45 GB container, 24 GB vram, 50 GB ram**</mark>

    /poddy add vid_upscale.sh

### Photo
#### Clothing Transfer
<mark>**45 GB container, 24 GB vram, 50 GB ram**</mark>  

    /poddy add img_clothing_transfer

#### Upscale
<mark>**45 GB container, 24 GB vram, 50 GB ram**</mark>  

    /poddy add img_upscale
