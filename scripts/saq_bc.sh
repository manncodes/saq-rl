#!/bin/bash

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib/nvidia
export XLA_PYTHON_CLIENT_PREALLOCATE=false
export D4RL_SUPPRESS_IMPORT_ERROR=1


# Environment parameters
env="halfcheetah-expert-v2"
vqvae_n_epochs=500  # Number of VQ-VAE epochs
bc_epochs=1001  # Number of BC epochs
dqn_n_epochs=1000 # Number of DQN epochs
max_traj_length=1000  # Maximum trajectory length (1000 for Locomotion Antmaze Kitchen, 200 for Adroit Door Hammer Relocate, 100 for Adroit Pen)
eval_period=50  # Evaluation period
n_train_step_per_epoch=1000  # Number of training steps per epoch

# VQ-BC parameters
vqn_cql_min_q_weight=0  # CQL minimum Q weight
vqn_qf_weight_decay=1e-3  # QF weight decay
vqn_codebook_size=32  # Codebook size (can try 32, 64, 128)
vqn_qf_arch="256-256"  # QF architecture
seed=24  # Random seed

# Logging parameters
output_dir="./results"  # Output directory for results
logging_online=True  # Set to False to disable online logging
logging_prefix="SAQ"  # Prefix for the experiment name
logging_project="BC"  # Wandb project name
logging_entity="jonzamora"  # Wandb entity

python -m vqn.vqn_main \
--seed=${seed} \
--env=${env} \
--bc_epochs=${bc_epochs} \
--vqvae_n_epochs=${vqvae_n_epochs} \
--max_traj_length=${max_traj_length} \
--eval_period=${eval_period} \
--n_train_step_per_epoch=${n_train_step_per_epoch} \
--vqn.cql_min_q_weight=${vqn_cql_min_q_weight} \
--vqn.qf_weight_decay=${vqn_qf_weight_decay} \
--vqn.codebook_size=${vqn_codebook_size} \
--vqn.qf_arch=${vqn_qf_arch} \
--dqn_n_epochs=${dqn_n_epochs} \
--logging.output_dir=${output_dir} \
--logging.online=${logging_online} \
--logging.prefix=${logging_prefix} \
--logging.entity=${logging_entity} \
--logging.project=${logging_project} \