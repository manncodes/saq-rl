dataset = D4RLDataset()
env = Env()
sampler = TrajSampler(env)
vqn = VQN(obv_dim, action_dim)

# train alternating
for dqn_epoch in range(FLAGS.dqn_n_epochs):
    for batch_idx in range(FLAGS.n_train_step_per_epoch):
        batch = dataset.sample(FLAGS.batch_size)
        vqn.train_vqvae(batch)
        vqn.train_dqn(batch)
