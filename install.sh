#! /bin/sh

workdir=/root/SimSwap
conda create -n simswap python=3.6 -y
conda install pytorch==1.8.0 torchvision==0.9.0 torchaudio==0.8.0 cudatoolkit=10.2 -c pytorch
source activate simswap
pip install -r requirements.txt

mkdir -p $workdir/insightface_func/models

cp /conent/drive/MyDrive/antelope.zip  $workdir/insightface_func/models/
cd $workdir/insightface_func/models
unzip antelope.zip

mkdir -p $workdir/parsing_model/chekpoint
cp /content/drive/MyDrive/79999_iter.pth $workdir/parsing_model/checkpoint/

mkdir -p $workdir/arcface_model
cp /content/drive/MyDrive/simswap_arcface_checkpoint.tar $workdir/arcface_model/arcface_checkpoint.tar

mkdir -p $workdir/checkpoints
cp /content/drive/MyDrive/simswap_checkpoints.zip $workdir/checkpoints/
cd $workdir/checkpoints
unzip simswap_checkpoints.zip

#python test_video_swapsingle.py --crop_size 224 --use_mask --name people --Arc_path arcface_model/arcface_checkpoint.tar --pic_a_path ./demo_file/Iron_man.jpg --video_path ./demo_file/multi_people_1080p.mp4 --output_path ./output/multi_test_swapsingle.mp4 --temp_path ./temp_results 