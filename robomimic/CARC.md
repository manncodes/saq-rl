# CARC Installation

Robomimic uses the `egl_probe` package to check for available GPU devices on clusters. 

Our experiments don't require this package, since we use 1 GPU by default for all experiments.

Thus, we can use a modified version of `robomimic` which removes the `egl_probe` dependency altogether.

```
cd robomimic
pip install -e .
```

I've already taken care of some intermediate steps, so all you need to do is `pip install -e .` the package and you'll be good to go.