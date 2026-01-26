WORKFLOW=${WORKFLOW:-"video_character_replace"}
cd /workspace/going_poddy/scripts/workflows
 ./{$WORKFLOW}.sh
# Install custom nodes and models
#if [ $WORKFLOW == "video_character_replace" ]; then
#    ./{$WORKFLOW}.sh
#elif [ $WORKFLOW == "video_lipsync" ]; then
#    ./video_lipsync.sh
#elif [ $WORKFLOW == "video_upscale" ]; then
#    ./video_upscale.sh
#elif [ $WORKFLOW == "photo_upscale" ]; then
#    ./photo_upscale.sh
#elif [ $WORKFLOW == "photo_clothing_transfer" ]; then
#    ./photo_clothing_transfer.sh
#else
#    ./photo_upscale.sh
#fi