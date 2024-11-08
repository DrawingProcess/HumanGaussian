#!/usr/bin/bash

#SBATCH -J SMPLX_NEUTRAL_base_unet_ema
#SBATCH --gres=gpu:1
#SBATCH --cpus-per-gpu=16
#SBATCH --mem-per-gpu=64G
#SBATCH -p batch_ugrad
#SBATCH -t 3-0
#SBATCH -o logs/slurm-%A.outs

cat $0
pwd
which python
hostname

. /data/sw/spack/share/spack/setup-env.sh
spack find
spack load cuda@11.7.1
nvcc -V

python launch.py --config configs/test.yaml --train --gpu 0 system.prompt_processor.prompt="A boy with a beanie wearing a hoodie and joggers"
