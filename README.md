<h1><a href="https://arxiv.org/abs/2310.11731">SAQ: Action-Quantized Offline Reinforcement Learning for Robotic Skill Learning</a></h1>


A simple and modular implementation of the SAQ algorithm in Jax and Flax. 

For more information, visit the website at https://saqrl.github.io


## Installation

1. Install the provided Conda environment (I recommend you use [Mamba](https://github.com/conda-forge/miniforge) instead of Conda -- Mamba is faster)

Note: `mamba` and `conda` commands are interchangeable.

```bash
mamba env create -f environment.yml
mamba activate saq
```

To install MuJoCo 210 on your Linux machine, follow the instructions from [this](https://gist.github.com/saratrajput/60b1310fe9d9df664f9983b38b50d5da) Github Gist.


2. Add this repo directory to your `PYTHONPATH` environment variable in your `~/.bashrc`.

Note: Your directory will be different. Use `pwd` to get the directory for this repo.

```bash
# For example:
export PYTHONPATH="$PYTHONPATH:/home/jonzamora/Desktop/projects/saq-rl"
```

## Run Experiments

For a complete list of D4RL tasks, see [here](https://github.com/Farama-Foundation/d4rl/wiki/Tasks).

**SAQ-BC** experiments can be run with the following command:

```bash
python -m vqn.vqn_main --env 'halfcheetah-medium-v2' --bc_epochs=1000 --logging.output_dir './experiment_output'
```
- All SAQ-BC command options can be found in `vqn/vqn_main.py` and `vqn/vqn.py`.

**SAQ-CQL** experiments can be run with the following command:

```bash
python -m vqn.vqn_main --env 'halfcheetah-medium-v2' --logging.output_dir './experiment_output'
```
- All SAQ-CQL command options can be found in `vqn/vqn_main.py` and `vqn/vqn.py`.


**SAQ-IQL** experiments can be run with the following command:

```bash
python -m vqn.vqiql_main --env 'HalfCheetah-v2' --logging.output_dir './experiment_output'
```
- All SAQ-IQL command options can be found in `vqn/vqiql_main.py` and `vqn/vqiql.py`.


This repository supports environments in D4RL(https://arxiv.org/abs/2004.07219) and Robomimic(https://arxiv.org/abs/2108.03298).

To install Robomimic and download the Robomimic datasets, visit https://robomimic.github.io/docs/datasets/robomimic_v0.1.html#downloading.


## Weights and Biases

This codebase logs experiment results to [Weights and Biases](https://wandb.ai/site). 

To log to W&B, you first need to set your W&B API key environment variable in your `~/.bashrc`:

```bash
export WANDB_API_KEY='YOUR W&B API KEY HERE'
```

Then, you can run experiments with W&B logging turned on:

```bash
python -m vqn.conservative_sac_main --env 'halfcheetah-medium-v0' --logging.output_dir './experiment_output' --logging.online
```

## Example Runs

For full working examples, you can run a sweep of **SAQ-CQL** on D4RL kitchen or **SAQ-IQL** on D4RL adroit using the following command:

```bash
bash scripts/vqcql_kitchen.sh
bash scripts/vqiql_adroit.sh
```

These scripts will generate the plots below.

<img src="./plots/saqcql_kitchen.png" width="60%" style="text-align:center;"/>

<img src="./plots/saqiql_adroit.png" width="60%" style="text-align:center;"/>


## Citation

If you found this code useful, consider citing the following paper:
```
@article{luo2023actionquantized,
  author    = {Jianlan Luo and Perry Dong and Jeffrey Wu and Aviral Kumar and Xinyang Geng and Sergey Levine},
  title     = {Action-Quantized Offline Reinforcement Learning for Robotic Skill Learning},
  booktitle   = {7th Annual Conference on Robot Learning},
  year      = {2023},
  url       = {https://openreview.net/forum?id=n9lew97SAn},
}
```

## Credits

The implementation of SAQ-CQL builds on [CQL](https://github.com/young-geng/JaxCQL)

The implementation of SAQ-IQL builds on [IQL](https://github.com/ikostrikov/implicit_q_learning)
