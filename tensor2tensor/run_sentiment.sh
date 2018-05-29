#!/bin/bash
Home=.
problem=sentiment_imdb
model=transformer_encoder
hparams=transformer_tiny

data_dir=$Home/t2t_data
tmp_dir=/tmp/t2t_datagen
train_dir=$Home/t2t_train/$problem/$model-$hparams
train_steps=2000
mkdir -p $data_dir $tmp_dir $train_dir

# generate data
t2t-datagen \
	--data_dir=$data_dir \
	--tmp_dir=$tmp_dir \
	--problem=$problem

# train
# *  if you run out of memory, add --hparams='batch_size=1024'.
t2t-trainer \
	--data_dir=$data_dir \
	--problem=$problem \
	--model=$model \
	--hparams_set=$hparams \
	--output_dir=$train_dir \
	--train_steps=$train_steps \
