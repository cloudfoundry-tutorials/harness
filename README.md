# harness

Assuming the following directory layout:

```terminal
$ tree . -L
.
├── cf-and-k8s
├── harness
├── hugo-whisper-theme
├── trycf
└── tutorials
```

Within the `harness` directory run the following to sync files and start Hugo:

```terminal
TUTORIAL=trycf ./run.sh
```

`CTRL+c` to exit, and `git clean -fdfx` to remove sync'd files.
