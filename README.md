<h1><a href="https://arxiv.org/abs/2310.11731">SAQ: Action-Quantized Offline Reinforcement Learning for Robotic Skill Learning</a></h1>


A simple and modular implementation of the SAQ algorithm in Jax and Flax. 

For more information, visit the website at https://saqrl.github.io

For a detailed plan of experiments, visit our Notion site [here](https://jonzamora.notion.site/SAQ-Action-Quantized-Offline-Reinforcement-Learning-for-Robotic-Skill-Learning-1aa159ec76524456961412d2560f1770)


## Installation

First, install the provided Conda environment (I recommend you use [Mamba](https://github.com/conda-forge/miniforge) instead of Conda -- Mamba is faster)

Note: `mamba` and `conda` commands are interchangeable.

```bash
mamba env create -f environment.yml
mamba activate saq
```

To install MuJoCo 210 on your Linux machine, follow the instructions from [this](https://gist.github.com/saratrajput/60b1310fe9d9df664f9983b38b50d5da) Github Gist.


Then, add this repo directory to your `PYTHONPATH` environment variable in your `~/.bashrc`.

Note: Your directory will be different. Use `pwd` to get the directory for this repo.

```bash
# For example:
export PYTHONPATH="$PYTHONPATH:/home/jonzamora/Desktop/projects/saq-rl"
```

## Weights and Biases

This codebase logs experiment results to [Weights and Biases](https://wandb.ai/site).

To log to W&B, you need to set your W&B API key environment variable in your `~/.bashrc`:

```bash
export WANDB_API_KEY='YOUR W&B API KEY HERE'
```

Prior to running experiments, update the `logging_entity` field in all `.sh` files under `scripts` to be your Weights and Biases username.

## Tasks

This repository supports environments in D4RL(https://arxiv.org/abs/2004.07219) and Robomimic(https://arxiv.org/abs/2108.03298).

For a complete list of D4RL tasks, see [here](https://github.com/Farama-Foundation/d4rl/wiki/Tasks).

To install Robomimic and download the Robomimic datasets, visit https://robomimic.github.io/docs/datasets/robomimic_v0.1.html#downloading.

## Run Experiments

**SAQ-BC** experiments can be run with the following command:

```bash
bash scripts/saq_bc.sh
```
- All SAQ-BC command options can be found in `vqn/vqn_main.py` and `vqn/vqn.py`.

**SAQ-CQL** experiments can be run with the following command:

```bash
bash scripts/saq_cql.sh
```
- All SAQ-CQL command options can be found in `vqn/vqn_main.py` and `vqn/vqn.py`.


**SAQ-IQL** experiments can be run with the following command:

```bash
bash scripts/saq_iql.sh
```
- All SAQ-IQL command options can be found in `vqn/vqiql_main.py` and `vqn/vqiql.py`.

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

The implementation of Aquadem builds on [Aquadem](https://github.com/google-research/google-research/tree/master/aquadem)
