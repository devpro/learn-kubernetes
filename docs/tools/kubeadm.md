# kubeadm

> Kubeadm is a tool built to provide best-practice "fast paths" for creating Kubernetes clusters.
> It performs the actions necessary to get a minimum viable, secure cluster up and running in a user friendly way.
> Kubeadm's scope is limited to the local node filesystem and the Kubernetes API, and it is intended to be a composable building block of higher level tools

🌐 [kubernetes.io/setup-tools/kubeadm](https://kubernetes.io/docs/reference/setup-tools/kubeadm/), [code](https://github.com/kubernetes/kubeadm), [docs](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/)

## Configuration

- `/etc/kubernetes/manifests`
- `/etc/kubernetes/manifests/kube-apiserver.yml`

## Command lines

```bash
# make sure swap is disabled
swapoff -a

# bootstrap the initial Kubernetes control-plane node -> will return a token and a SHA256 hash
kubeadm init

# (optional) create a network manually or with kubectl create -f

# bootstrap a Kubernetes worker node or an additional control plane node, and join it to the cluster
kubeadm join --token <token> <control-plane-host>:<control-plane-port> --discovery-token-ca-cert-hash sha256:<hash>

# upgrade a Kubernetes cluster to a newer version
kubeadm upgrade

# verify the upgrade plan (and see latest version available)
kubeadm upgrade plan

# revert any changes made to this host by kubeadm init or kubeadm join
kubeadm reset
```

Examples: [herpiko/kubedingdong.md](https://gist.github.com/herpiko/9d3b984e4f7a465b3562c36e8879af55)
