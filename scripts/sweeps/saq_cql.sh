#!/bin/bash

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib/nvidia
export XLA_PYTHON_CLIENT_PREALLOCATE=false
export D4RL_SUPPRESS_IMPORT_ERROR=1


# Environment parameters
eval_period=50  # Evaluation period
vqvae_n_epochs=500  # Number of VQ-VAE epochs
dqn_n_epochs=1000  # Number of DQN epochs
bc_epochs=0  # Number of behavioral cloning epochs
n_train_step_per_epoch=1000  # Number of training steps per epoch
seed=24  # Random seed

# SAQ parameters
vqn_cql_min_q_weight=10  # VQN CQL min Q weight (can try 10, 15, 20, 30)
vqn_qf_weight_decay=1e-3  # VQN Q-function weight decay

# Logging parameters
output_dir="./results"  # Output directory for results
logging_online=True  # Set to False to disable online logging
logging_prefix="SAQ"  # Prefix for the experiment name
logging_project="CQL"  # Wandb project name
logging_entity="jonzamora"  # Wandb entity

python -m vqn.vqn_main \
--seed=${seed} \
--env="$1" \
--max_traj_length="$2" \
--eval_period=${eval_period} \
--vqvae_n_epochs=${vqvae_n_epochs} \
--dqn_n_epochs=${dqn_n_epochs} \
--bc_epochs=${bc_epochs} \
--n_train_step_per_epoch=${n_train_step_per_epoch} \
--vqn.cql_min_q_weight=${vqn_cql_min_q_weight} \
--vqn.qf_weight_decay=${vqn_qf_weight_decay} \
--logging.output_dir=${output_dir} \
--logging.online=${logging_online} \
--logging.prefix=${logging_prefix} \
--logging.entity=${logging_entity} \
--logging.project=${logging_project}