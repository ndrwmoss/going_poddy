# Going Poddy
A CUDA 12.8, ComfyUI, Sage Attention Runpod pod with quick installs for various multimedia workflows. Like most people I don't own a graphics card that costs more than my car so runpod is my platform of choice for a la cart AI processing power. I may only need the pod for 10 minutes, I may need it a few hours, so it's not really efficient to make them an API, nor is it truly efficient to do long term storage on a pod due to the random nature of my use and the wait for pods in specific clusters to become available, so I choose to just deploy a new pod everytime I need one. That's where this image and the installers come in: I don't need to manually redownload everything every single time I deploy, I just type in a single command and almost everything happens under the hood and only takes between 5-10 minutes (depends on the package's models size and server bandwidth/cpu lottery) to get into Comfy and actually working. The workflows included are ones that I've found use for in my own multimedia projects, so others may be able to find use as well. I provide a link to the original source of the workflow below, click the link to learn how to use the workflow. Realize each of these workflows has probably been slightly edited, mainly changing models so I'm not downloading a ton of variants of the same model. For my models I choose a medium to medium high quality variant, depending on the model in question, I find this to generally be the point of the economic curve where the quality of the results matches the price of the processing.

## Install

The pod installs a simple image, after boot the image downloads any package(s) (workflows + custom nodes + models) you choose, simply type in ``/poddy install ``  followed by an install command (found below) into the terminal, or add the install command(s) to the Pod Configuration under PREINSTALL on the pod deployment page for a seemless install. To uninstall a package do the same thing but replace ``install`` with ``uninstall``. The pod automatically updates the going_poddy workflows and isntallers on start but you can also manually do it by typing ``/poddy update ``.


##
### Base Container Size: 11 GB
### Base Container DL/Install time: ~3-5 minutes depending on server lottery.
##
# Video




##
# Photo
### Hair Transfer
<mark>disk space: **35 GB**</mark>  
<mark>dl/install time: **2-5 minutes**</mark>  

    /poddy i hair_transfer

Based on [Stable Hair II](https://github.com/lldacing/ComfyUI_StableHair_ll/blob/main/README_EN.md)  

Transfers hair from one subject to another, meant for realism and may have problems with animation hair. Both images should be 512 x 512 pixels. Other sizes work but with much MUCH more error, if choosing to use a custom size the image dimensions must be divisible by 16. The workflow has 2 stages, one where it takes the subject getting their hair changed and makes them bald, the second stage removes the hair from the second subject and places it on the main subject's head. It make take several different seeds (play with CFG between 1.0-3.0 as well) to get the subject bald. When you've got the bald down, make sure to set seed changing to fixed, that way you can apply multiple different hairstyle without having to process the bald phase.

#### QWEN Edit
The workflows are by 
All workflows prefixed by QIE are by [pixaroma](https://www.youtube.com/watch?v=myuV6vjkGIw)  
All workflows prefixed by faboro are by [Faboro Hacks](https://www.youtube.com/watch?v=_QYBgeII9Pg)  
All workflows prefixed by apex are by [Apex Artist](https://www.youtube.com/watch?v=v6xOY5x4NFU)  
All workflows prefixed by llama are by [Llamabytes](https://www.youtube.com/watch?v=YBhYAVUfPvg)  
All workflows prefixed by allison are by [Alissonerdx](https://huggingface.co/Alissonerdx/BFS-Best-Face-Swap)  
https://huggingface.co/Alissonerdx/BFS-Best-Face-Swap
<mark>disk space: **base container size + 35 GB**</mark>   

    /poddy i img_qwen_edit

#### Upscale
<mark>disk space: **base container size + 35 GB**</mark>      

    /poddy i img_flux_upscale

##
# Audio
### Ace Step 1.5
The workflows are by [RyanOnTheInside](https://www.youtube.com/watch?v=R6ksf5GSsrk).  
[Syman UK](https://openart.ai/workflows/chimpanzee_skinny_81/audio-ace-step-15-turbosft-make-song-with-lora/QnVFyPIUTrVhkxY97KN3)  
<mark>disk space: **base container size + 35 GB**</mark>   

    /poddy i aud_acestep