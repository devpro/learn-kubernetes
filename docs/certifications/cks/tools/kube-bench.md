# kube-bench

> **kube-bench** is a tool that checks whether Kubernetes is deployed securely by running the checks documented in the **CIS Kubernetes Benchmark**.
>
> &mdash; _[github.com/aquasecurity/kube-bench](https://github.com/aquasecurity/kube-bench)_

## Usage

### Run it inside a container (will use the current kubeconfig)

```bash
docker run --pid=host -v /etc:/etc:ro -v /var:/var:ro -t docker.io/aquasec/kube-bench:latest --version 1.18
```

### Run the binary

```bash
# displays kube-bench's help
kube-bench --help

# runs kube-bench on a control plan node
kube-bench run --targets master

# runs kube-bench on a worker node
kube-bench run --targets node
```
