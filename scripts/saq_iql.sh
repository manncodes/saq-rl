#!/bin/bash

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib/nvidia
export XLA_PYTHON_CLIENT_PREALLOCATE=false
export D4RL_SUPPRESS_IMPORT_ERROR=1


# Environment parameters
env="halfcheetah-expert-v2"
max_traj_length=1000  # Maximum trajectory length (1000 for Locomotion Antmaze Kitchen, 200 for Adroit Door Hammer Relocate, 100 for Adroit Pen)
eval_period=50  # Evaluation period
eval_n_trajs=20  # Number of evaluation trajectories
n_pi_beta_epochs=2000  # Number of pi and beta epochs
vqvae_n_epochs=500  # Number of VQ-VAE epochs
n_epochs=1000  # Number of epochs
n_train_step_per_epoch=1000  # Number of training steps per epoch
seed=24  # Random seed

# SAQ parameters
codebook_size=32  # Codebook size (can try 32, 64, 128)
vqvae_arch="512-512"  # VQ-VAE architecture
sample_action=True  # Sample action from the policy
qf_weight_decay=1e-3  # Q-function weight decay
iql_expectile=0.8  # IQL expectile (can try 0.8, 0.9, 0.7)
iql_temperature=1  # IQL temperature (can try 1, 0.5, 2)
kl_divergence_weight=0  # KL divergence weight


# Logging parameters
output_dir="./results"  # Output directory for results
logging_online=True  # Set to False to disable online logging
logging_prefix="SAQ"  # Prefix for the experiment name
logging_project="IQL"  # Wandb project name
logging_entity="jonzamora"  # Wandb entity

python -m vqn.vqiql_main \
--seed=${seed} \
--env=${env} \
--max_traj_length=${max_traj_length} \
--eval_period=${eval_period} \
--eval_n_trajs=${eval_n_trajs} \
--n_pi_beta_epochs=${n_pi_beta_epochs} \
--vqvae_n_epochs=${vqvae_n_epochs} \
--n_epochs=${n_epochs} \
--n_train_step_per_epoch=${n_train_step_per_epoch} \
--codebook_size=${codebook_size} \
--vqvae_arch=${vqvae_arch} \
--sample_action=${sample_action} \
--qf_weight_decay=${qf_weight_decay} \
--iql_expectile=${iql_expectile} \
--iql_temperature=${iql_temperature} \
--kl_divergence_weight=${kl_divergence_weight} \
--logging.output_dir=${output_dir} \
--logging.online=${logging_online} \
--logging.prefix=${logging_prefix} \
--logging.entity=${logging_entity} \
--logging.project=${logging_project}