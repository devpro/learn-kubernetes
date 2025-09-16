# kube-bench

## Run it inside a container (will use the current kubeconfig)

```bash
docker run --pid=host -v /etc:/etc:ro -v /var:/var:ro -t docker.io/aquasec/kube-bench:latest --version 1.18
```

## Run the binary

```bash
# displays kube-bench's help
kube-bench --help

# runs kube-bench on a control plan node
kube-bench run --targets master

# runs kube-bench on a worker node
kube-bench run --targets node
```
