# Going Poddy

## (WORK IN PROGRESS)
A source for quickly getting the resources you need for specific Runpod ComfyUI workflows.
## Install

1. Go to the official [ComfyUI Sageattention Template (jnxmx/comfy25:new128)](https://console.runpod.io/hub/template/comfyui-sageattention?id=f4sahjc81c)  

2. Click **Configure Pod**.  

3. Choose the hardware options you want on the next page, when you've selected a GPU it will scroll the page down to...  

4. The **Configure Deployment** section has a button labelled <mark>Edit</mark>, click that button to open the **Pod Template Overrides** popup.  

5. Set your container disk to an appropriate size for the workflow you're trying to install, and set a volume disk if don't want to reinstall every boot.  

6. Scroll to the bottom of the page and click <mark>Deploy</mark>.  

7. When the pod has started, click the <mark>Connect</mark> tab and ensure the SSH terminal toggle is turned to <mark>On</mark>.  

8. Open the terminal and paste the following code to install going_poddy on your pod.  

    ```
    cd /workspace
    git clone https://github.com/ndrwmoss/going_poddy
    chmod -R +x /workspace/going_poddy/scripts
    ```
9. Copy one of the commands below for the workflow you want and paste it in the terminal, if the command has <mark>&CIVITAI</mark> in it, replace <mark>&CIVITAI</mark> Civitai api key. Press enter, the script will download and install all custom nodes and models the workflow requires.  
10. Open ComfyUI on the pod, and restart ComfyUI for the changes to take effect, you're now ready to go.
## Workflows
### Video

#### Character Replace
    ./video_character_replace.sh

#### Lipsync
    ./video_lipsync.sh

#### Upscale
    ./video_upscale.sh $CIVITAI

### Photo
#### Clothing Transfer
    ./photo_clothing_transfer.sh $CIVITAI

#### Upscale
    ./photo_upscale.sh $CIVITAI
