#!/usr/bin/env bash
#SBATCH --mem=20G
#SBATCH --time=7-0
#SBATCH --gres=gpu:1
#SBATCH -c4

variant="$1"; shift

args=""
while true; do
  case "$1" in
    -*) args="$args $1"; shift 1; continue;;
  esac
  break
done

export CUDA_VISIBLE_DEVICES=1
export CUDA_ROOT=/usr/local/nvidia/cuda/9.0
export CUDA_HOME=$CUDA_ROOT
export CUDNN_ROOT=/usr/local/nvidia/cuda/9.0/cudnn-7.1
export PATH=$CUDA_ROOT/bin:$PATH
export LD_LIBRARY_PATH=$CUDA_ROOT/lib64:$CUDNN_ROOT/lib64:$LD_LIBRARY_PATH

source /cs/nlp/danielh/miniconda3/bin/activate udpipe-cortex
python ud_parser$variant.py UD_English-EWT/en_ewt $args

