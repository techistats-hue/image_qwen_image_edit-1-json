# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.1-base

# install custom nodes into comfyui (first node with --mode remote to fetch updated cache)
# No registry-verified custom nodes found.
# Could not resolve unknown_registry node 'MarkdownNote' - no aux_id provided, skipping
# Could not resolve unknown_registry node 'MarkdownNote' - no aux_id provided, skipping
# Could not resolve unknown_registry node '74a8e1e2-9cb8-4112-978e-06ce1b5793f1' - no aux_id provided, skipping

# download models into comfyui
RUN comfy model download --url https://huggingface.co/Comfy-Org/Qwen-Image-Edit_ComfyUI/resolve/main/split_files/diffusion_models/qwen_image_edit_fp8_e4m3fn.safetensors --relative-path models/diffusion_models/qwen-image-edit --filename qwen_image_edit_fp8_e4m3fn.safetensors
RUN comfy model download --url https://huggingface.co/Comfy-Org/Qwen-Image_ComfyUI/resolve/main/split_files/text_encoders/qwen_2.5_vl_7b_fp8_scaled.safetensors --relative-path models/clip/qwen --filename qwen_2.5_vl_7b_fp8_scaled.safetensors
RUN comfy model download --url https://huggingface.co/Comfy-Org/Qwen-Image_ComfyUI/resolve/main/split_files/vae/qwen_image_vae.safetensors --relative-path models/vae/qwen-image --filename qwen_image_vae.safetensors
RUN comfy model download --url https://huggingface.co/lightx2v/Qwen-Image-Lightning/resolve/main/Qwen-Image-Edit-Lightning-4steps-V1.0-bf16.safetensors --relative-path models/loras/qwen-image-edit-lightning --filename Qwen-Image-Edit-Lightning-4steps-V1.0-bf16.safetensors

# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/
