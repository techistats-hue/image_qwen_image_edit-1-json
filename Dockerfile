# ============================================================
# Qwen Image Edit 2511 - RunPod Serverless Worker
# Base: runpod/worker-comfyui (includes ComfyUI + comfy-cli + ComfyUI-Manager)
# ============================================================
FROM runpod/worker-comfyui:5.5.1-base

# ============================================================
# DIFFUSION MODEL
# 2511 fp8mixed model - uses UNETLoader with weight_dtype: default
# Stored in: models/diffusion_models/
# ============================================================
RUN comfy model download \
    --url https://huggingface.co/Comfy-Org/Qwen-Image-Edit_ComfyUI/resolve/main/split_files/diffusion_models/qwen_image_edit_2511_fp8mixed.safetensors \
    --relative-path models/diffusion_models \
    --filename qwen_image_edit_2511_fp8mixed.safetensors

# ============================================================
# TEXT ENCODER (CLIP)
# NOTE: stored in text_encoders/ NOT clip/
# The CLIPLoader uses type: "qwen_image"
# ============================================================
RUN comfy model download \
    --url https://huggingface.co/Comfy-Org/HunyuanVideo_1.5_repackaged/resolve/main/split_files/text_encoders/qwen_2.5_vl_7b_fp8_scaled.safetensors \
    --relative-path models/text_encoders \
    --filename qwen_2.5_vl_7b_fp8_scaled.safetensors

# ============================================================
# VAE
# Stored in: models/vae/
# ============================================================
RUN comfy model download \
    --url https://huggingface.co/Comfy-Org/Qwen-Image_ComfyUI/resolve/main/split_files/vae/qwen_image_vae.safetensors \
    --relative-path models/vae \
    --filename qwen_image_vae.safetensors

# ============================================================
# LIGHTNING LORA (4-step fast mode)
# Stored in: models/loras/
# Enable via enable_turbo_mode: true in payload
# ============================================================
RUN comfy model download \
    --url https://huggingface.co/lightx2v/Qwen-Image-Edit-2511-Lightning/resolve/main/Qwen-Image-Edit-2511-Lightning-4steps-V1.0-bf16.safetensors \
    --relative-path models/loras \
    --filename Qwen-Image-Edit-2511-Lightning-4steps-V1.0-bf16.safetensors
