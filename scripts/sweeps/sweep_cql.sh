#!/bin/bash

# Function to execute saq_cql.sh for given environment and trajectory length
run_saq_cql() {
    local env="$1"
    local max_traj_length="$2"
    ./saq_cql.sh "$env" "$max_traj_length"
}

# Define environments and maximum trajectory lengths for different tasks
declare -A tasks=(
    ["Locomotion"]=(["environments"]=(
                        "halfcheetah-expert-v2"
                        "halfcheetah-medium-expert-v2"
                        "halfcheetah-medium-replay-v2"
                        "halfcheetah-medium-v2"
                        "hopper-expert-v2"
                        "hopper-medium-expert-v2"
                        "hopper-medium-replay-v2"
                        "hopper-medium-v2"
                        "walker2d-expert-v2"
                        "walker2d-medium-expert-v2"
                        "walker2d-medium-replay-v2"
                        "walker2d-medium-v2"
                    )
                    ["max_traj_lengths"]=(1000 1000 1000 1000 1000 1000 1000 1000 1000 1000 1000 1000)
    )
    ["Antmaze"]=(["environments"]=(
                        "antmaze-medium-diverse-v2"
                        "antmaze-medium-play-v2"
                        "antmaze-large-diverse-v2"
                        "antmaze-large-play-v2"
                    )
                    ["max_traj_lengths"]=(1000 1000 1000 1000)
    )
    ["Adroit"]=(["environments"]=(
                        "door-human-v0"
                        "hammer-human-v0"
                        "pen-human-v0"
                        "relocate-human-v0"
                    )
                    ["max_traj_lengths"]=(200 200 100 200)
    )
    ["Kitchen"]=(["environments"]=(
                        "kitchen-mixed-v0"
                        "kitchen-complete-v0"
                        "kitchen-partial-v0"
                    )
                    ["max_traj_lengths"]=(1000 1000 1000)
    )
)

# Iterate over each task
for task_name in "${!tasks[@]}"; do
    environments=("${tasks[$task_name][environments]}")
    max_traj_lengths=("${tasks[$task_name][max_traj_lengths]}")
    
    # Iterate over each combination of environment and maximum trajectory length for the task
    for ((i=0; i<${#environments[@]}; ++i)); do
        run_saq_cql "${environments[i]}" "${max_traj_lengths[i]}"
    done
done
