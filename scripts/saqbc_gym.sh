env="halfcheetah-expert-v2"
bc_epochs=1000
output_dir="./experiment_output"
logging_online=True
logging_prefix="SAQ"
logging_entity="jonzamora"
logging_project="BC"

python -m vqn.vqn_main \
--env=${env} \
--bc_epochs=${bc_epochs} \
--vqvae_n_epochs=500 \
--max_traj_length=1000 \
--eval_period=50 \
--n_train_step_per_epoch=1000 \
--vqn.cql_min_q_weight 0 \
--dqn_n_epochs=${bc_epochs} \
--logging.output_dir=${output_dir} \
--logging.online=${logging_online} \
--logging.prefix=${logging_prefix} \
--logging.entity=${logging_entity} \
--logging.project=${logging_project} \