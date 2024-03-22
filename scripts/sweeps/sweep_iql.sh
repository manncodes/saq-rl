#!/bin/bash

# Function to execute saq_iql.sh for given environment and trajectory length
run_saq_iql() {
    local env="$1"
    local max_traj_length="$2"
    bash scripts/sweeps/saq_iql.sh "$env" "$max_traj_length"
}

# Define environments and maximum trajectory lengths for different tasks

# Locomotion task
locomotion_environments=(
    "hopper-expert-v2"
    "hopper-medium-expert-v2"
    "hopper-medium-replay-v2"
    "hopper-medium-v2"
    "walker2d-expert-v2"
    "walker2d-medium-expert-v2"
    "walker2d-medium-replay-v2"
    "walker2d-medium-v2"
)
locomotion_max_traj_lengths=(
    1000 1000 1000 1000 1000 1000 1000 1000
)

# Antmaze task
antmaze_environments=(
    "antmaze-medium-diverse-v2"
    "antmaze-medium-play-v2"
    "antmaze-large-diverse-v2"
    "antmaze-large-play-v2"
)
antmaze_max_traj_lengths=(
    1000 1000 1000 1000
)

# Adroit task
adroit_environments=(
    "door-human-v0"
    "hammer-human-v0"
    "pen-human-v0"
    "relocate-human-v0"
)
adroit_max_traj_lengths=(
    200 200 100 200
)

# Kitchen task
kitchen_environments=(
    "kitchen-mixed-v0"
    "kitchen-complete-v0"
    "kitchen-partial-v0"
)
kitchen_max_traj_lengths=(
    1000 1000 1000
)

# Function to run tasks
run_task() {
    local -n environments="$1"  # Reference to the environments array
    local -n max_traj_lengths="$2"  # Reference to the max_traj_lengths array

    for ((i=0; i<${#environments[@]}; ++i)); do
        run_saq_iql "${environments[i]}" "${max_traj_lengths[i]}"
    done
}

run_task locomotion_environments locomotion_max_traj_lengths
run_task antmaze_environments antmaze_max_traj_lengths
run_task adroit_environments adroit_max_traj_lengths
run_task kitchen_environments kitchen_max_traj_lengths
