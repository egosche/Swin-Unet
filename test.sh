#!/bin/bash -l

# Default values
EPOCH_TIME=150
OUT_DIR='./output'
CFG='configs/swin_tiny_patch4_window7_224_lite.yaml'
DATA_DIR='datasets/Synapse'
LEARNING_RATE=0.05
IMG_SIZE=224
BATCH_SIZE=24

# Check if variables are set and override defaults if needed
if [ -n "$epoch_time" ]; then
    EPOCH_TIME=$epoch_time
fi

if [ -n "$out_dir" ]; then
    OUT_DIR=$out_dir
fi

if [ -n "$cfg" ]; then
    CFG=$cfg
fi

if [ -n "$data_dir" ]; then
    DATA_DIR=$data_dir
fi

if [ -n "$learning_rate" ]; then
    LEARNING_RATE=$learning_rate
fi

if [ -n "$img_size" ]; then
    IMG_SIZE=$img_size
fi

if [ -n "$batch_size" ]; then
    BATCH_SIZE=$batch_size
fi

echo "start test model"
python test.py --dataset Synapse --cfg "$CFG" --is_saveni --volume_path "$DATA_DIR" --max_epochs "$EPOCH_TIME" --output_dir "$OUT_DIR" --img_size "$IMG_SIZE" --base_lr "$LEARNING_RATE" --batch_size "$BATCH_SIZE"
