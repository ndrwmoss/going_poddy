# Going Poddy
A CUDA 12.8, ComfyUI, Sage Attention Runpod pod with quick installs for various multimedia workflows including QWEN, QWEN Edit, Z-Image, Wan 2.2, and Flux. 

Like most people I don't own a graphics card that costs more than my car so runpod is my platform of choice for a la cart AI processing power. I may only need the pod for 10 minutes, I may need it a few hours, so it's not really efficient to make an API, nor is it truly efficient to do long term storage on a pod due to the random nature of my use and the wait for pods in specific clusters to become available, so I choose to deploy a new pod everytime I need one. 

That's where this image and the installers come in: I don't need to manually redownload everything every single time I deploy, I just type in a single command and almost everything happens under the hood and only takes between 5-10 minutes (depends on the package's models size and server bandwidth/cpu lottery) to get into Comfy and actually working. The workflows included are ones that I've found use for in my own multimedia projects, so others may be able to find use as well. I provide a link to the original source of the workflow below, click the link to learn how to use the workflow. Realize each of these workflows has probably been slightly edited, mainly changing models so I'm not downloading a ton of variants of the same model. For my models I choose a medium to medium high quality variant, depending on the model in question, I find this to generally be the point of the economic curve where the quality of the results matches the price of the processing.

## Install
<mark>YOU MUST ADD BOTH A CIVITAI AND HUGGINGFACE  API TOKEN for downloads to work. Visit the settings section of those sites to get/generate your api key and enter them as ``secrets`` in the templates ``Environmental Variables`` section.</mark> 

The pod installs a simple image, after boot the image downloads any package(s) (workflows + custom nodes + models) you choose, simply type in ``/poddy i ``  followed by an install command (found below) into the terminal, or add the install command(s) to the Pod Configuration under PREINSTALL on the pod deployment page for a seamless install. To uninstall a package do the same thing but replace ``i`` with ``u``. The pod automatically updates the going_poddy workflows and installers on start but you can also manually do it by typing ``/poddy update ``.


##
### Base Container Size: 11 GB
### Base Container DL/Install time: ~3-5 minutes depending on server lottery.
##
# Audio
### Ace Step 1.5
<mark>disk space: **35 GB**</mark>  
<mark>dl/install time: **2-5 minutes**</mark>  

The following workflows, prefixed by ace_roi, are by [RyanOnTheInside](https://www.youtube.com/watch?v=R6ksf5GSsrk):  
chimp  
cover_semantic_blending  
cover  
edit_with_reference  
edit  
lora_training  
prompt_lora_blending  
std  

    /poddy i acestep

##
# Video
### WAN Character Replace
<mark>disk space: **35 GB**</mark>  
<mark>dl/install time: **2-5 minutes**</mark>  

The following workflows, prefixed by vid, are by [MDMZ](https://www.youtube.com/watch?v=woCP1Q_Htwo):  

character_replace  
character_and_bg_replace  

    /poddy i wan_character_replace

### WAN Lipsync
<mark>disk space: **35 GB**</mark>  
<mark>dl/install time: **2-5 minutes**</mark>  

The workflow is by [Blue Spork](https://www.youtube.com/watch?v=LR4lBimS7O4).  

    /poddy i wan_lipsync

### WAN Upscale
<mark>disk space: **35 GB**</mark>  
<mark>dl/install time: **2-5 minutes**</mark>  

The workflow is by [Mickmumpitz](https://www.youtube.com/watch?v=NpNagmQI4yg).  

    /poddy i wan_upscale

##
# Photo

### Z-Image Turbo
<mark>disk space: **35 GB**</mark>  
<mark>dl/install time: **2-5 minutes**</mark>  

The following workflows, prefixed by zit_pix, are by [pixaroma](https://www.youtube.com/watch?v=DYzHAX15QL4):  

txt2img_2k  
txt2img_bf16  
txt2img_canny  
txt2img_depth  
txt2img_hd  
txt2img_lora  
txt2img_lora_style  
txt2img_pose  
txt2img_qwenvl_image  
txt2img_qwenvl_text  
upscale  

    /poddy i zit

### Epic Realism
<mark>disk space: **35 GB**</mark>  
<mark>dl/install time: **2-5 minutes**</mark>  

The following workflows are by [Stable Hair II](https://github.com/lldacing/ComfyUI_StableHair_ll/blob/main/README_EN.md):  

epic_realism_hair_transfer  

The following workflows, prefixed by epic_realism_pix, are by [pixaroma](https://www.youtube.com/watch?v=qLZJ7iSq9tY):  

inpaint  
outpaint  

    /poddy i epic_realism

### Juggernaut
<mark>disk space: **35 GB**</mark>  
<mark>dl/install time: **2-5 minutes**</mark>  

The following workflows are by [Stable Hair II](https://github.com/lldacing/ComfyUI_StableHair_ll/blob/main/README_EN.md):  

juggernaut_hair_transfer  

The following workflows, prefixed by juggernaut_pix, are by [pixaroma](https://www.youtube.com/watch?v=qLZJ7iSq9tY):  

inpaint  
outpaint  

    /poddy i juggernaut

### Flux Kontext
<mark>disk space: **35 GB**</mark>  
<mark>dl/install time: **2-5 minutes**</mark>  

The following workflows, prefixed by flux_pix, are by [pixaroma](https://www.youtube.com/watch?v=9-onDeEWWvU&):  

change_hair_color  
change_hair_style  
change_the_color  
change_the_text  
change_weather_and_light  
character_consistency  
combine_2_images_custom_size  
custom_size  
image_editing  
image_generation  
kontext_inpaint  
remove_items  
remove_items_inpaint  
replace_a_character  
replace_the_background  
style_reference  
style_reference_custom_size  
transform_2_lineart  
transform_2_watercolor  
transform_lineart_2_color  

    /poddy i flux_kontext

### Flux Fill
<mark>disk space: **35 GB**</mark>  
<mark>dl/install time: **2-5 minutes**</mark>  

The following workflows, prefixed by flux_pix, are by [pixaroma](https://www.youtube.com/watch?v=qLZJ7iSq9tY):  

inpaint  
outpaint  

    /poddy i flux_fill

### Flux SVG
<mark>disk space: **35 GB**</mark>  
<mark>dl/install time: **2-5 minutes**</mark>  

The following workflows, prefixed by svg, are by [pixaroma](https://www.youtube.com/watch?v=68z1S3EMCAM):  
generate_vector_designs  
image _to_vector_silhouette  
image_vector_variation  
img_to_svg  

    /poddy i flux_svg

### Flux Dev
<mark>disk space: **35 GB**</mark>  
<mark>dl/install time: **2-5 minutes**</mark>  

The following workflows, prefixed by flux_pix, are by [pixaroma](https://www.youtube.com/watch?v=xfxFEBVIF8k):  
i2i  
t2i   
upscaler  

    /poddy i flux_dev

### QWEN Edit
<mark>disk space: **base container size + 35 GB**</mark>  
All workflows prefixed by QIE_pix are by 

The following workflows, prefixed by QIE_pix, are by [pixaroma](https://www.youtube.com/watch?v=myuV6vjkGIw):  

add_items  
change_ratio  
character_turnaround  
clothes_2_images  
clothes_3_images  
clothes_one_image  
colorize_photo  
combine_2_images  
combine_3_images  
combine_4_images  
clothes_one_image  
colorize_photo  
combine_2_images  
combine_3_images  
combine_4_images  
inpaint  
one_image_edit_change_ratio  
one_image_edit  
remove_items  
replace_background  
replace_character  
replace_text  
restore_photo  

The following workflows, prefixed by QIE_fab, are by [Faboro Hacks](https://www.youtube.com/watch?v=_QYBgeII9Pg):  

face2face_uncensored  
face_swap  

The following workflows, prefixed by QIE_apex, are by [Apex Artist](https://www.youtube.com/watch?v=v6xOY5x4NFU):  

controlnet  

The following workflows, prefixed by QIE_lla, are by [Llamabytes](https://www.youtube.com/watch?v=YBhYAVUfPvg):  

face_swap  

The following workflows, prefixed by QIE_ali, are by [Alissonerdx](https://huggingface.co/Alissonerdx/BFS-Best-Face-Swap):  

head_swap  

The following workflows, prefixed by QIE_clothing, are by [Clothes Try On](https://civitai.com/models/1940532/clothes-try-on-clothing-transfer-qwen-edit):  

extract  
transfer  

    /poddy i qwen_edit
