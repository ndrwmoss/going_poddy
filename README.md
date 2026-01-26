# Going Poddy

## (WORK IN PROGRESS)
A source for quickly getting the resources you need for specific Runpod ComfyUI workflows.
## Install

1. Go to the official [Runpod Pytorch 2.8.0 template](https://console.runpod.io/hub/template/runpod-pytorch-2-8-0?id=runpod-torch-v280)
2. Click **Configure Pod**.
3. Choose the hardware options you want on the next page, when you've selected a GPU it will scroll the page down to...
4. The **Configure Deployment** section has a button labelled <mark>Edit</mark>, click that button to open the **Pod Template Overrides** popup.
5. Template overrides:  
A. Set your container disk to an appropriate size for the workflow you're trying to install, and set a volume disk if don't want to reinstall every boot.  
B. Change the ports from <mark>8888</mark> to <mark>8888, 8188</mark>  
C. Click **Environment Variables** a drop down with new options will appear, click <mark>Raw Editor</mark> which will open a textbox.  
D. In the textbox type <mark>CIVITAI=</mark> followed by your Civitai api key. Example: CIVITAI=557c272c99899cc3dd8ade99b71ff920  
E. Click <mark>Update Variables</mark> then click <mark>Set Overrides</mark> to close the popup  
6. Scroll to the bottom of the page and click <mark>Deploy</mark>.
7. When the pod has started, click the <mark>Connect</mark> tab and ensure the SSH terminal toggle is turned to <mark>On</mark>.
8. Open the terminal and paste in one of the scripts below. Replace <mark>&CIVITAI=</mark> in the script with your Civitai api key. Press enter, the script will download and install, ComfyUI, any custom nodes the workflow requires, as well as any models the workflow needs.
## Workflows
### Video

#### Character Replace
    cd /workspace
    git clone https://github.com/ndrwmoss/going_poddy
    chmod -R +x /workspace/going_poddy/scripts
    cd /workspace/going_poddy/scripts/install
    ./install --video_character_replace --$CIVITAI

#### Lipsync
    cd /workspace
    git clone https://github.com/ndrwmoss/going_poddy
    chmod -R +x /workspace/going_poddy/scripts
    cd /workspace/going_poddy/scripts/install
    ./install --video_lipsync --$CIVITAI

#### Upscale
    cd /workspace
    git clone https://github.com/ndrwmoss/going_poddy
    chmod -R +x /workspace/going_poddy/scripts
    cd /workspace/going_poddy/scripts/install
    ./install --video_upscale --$CIVITAI

### Photo
#### Clothing Transfer
    cd /workspace
    git clone https://github.com/ndrwmoss/going_poddy
    chmod -R +x /workspace/going_poddy/scripts
    cd /workspace/going_poddy/scripts/install
    ./install --photo_clothing_transfer --$CIVITAI

#### Upscale
    cd /workspace
    git clone https://github.com/ndrwmoss/going_poddy
    chmod -R +x /workspace/going_poddy/scripts
    cd /workspace/going_poddy/scripts/install
    ./install --photo_upscale --$CIVITAI
