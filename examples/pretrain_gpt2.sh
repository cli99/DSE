#! /bin/bash

# Runs the "345M" parameter model

RANK=0
WORLD_SIZE=1

DATA_PATH=data/webtext/webtext_text_document
CHECKPOINT_PATH=checkpoints/gpt2_345m


python pretrain_gpt2.py \
       --num-layers 4 \
       --hidden-size 512 \
       --num-attention-heads 16 \
       --batch-size 8 \
       --seq-length 1024 \
       --max-position-embeddings 1024 \
       --train-iters 5000 \
       --lr-decay-iters 320000 \
       --save $CHECKPOINT_PATH \
       --load $CHECKPOINT_PATH \
       --data-path $DATA_PATH \
       --vocab-file data/gpt2-vocab.json \
       --merge-file data/gpt2-merges.txt \
       --data-impl mmap \
       --split 949,50,1 \
       --distributed-backend nccl \
       --lr 0.00015 \
       --min-lr 1.0e-5 \
       --lr-decay-style cosine \
       --weight-decay 1e-2 \
       --clip-grad 1.0 \
       --warmup .01 \
       --checkpoint-activations \
       --log-interval 100 \
       --save-interval 10000 \
       --eval-interval 1000 \
       --eval-iters 10 \
       --fp16


set +x
