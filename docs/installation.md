# Installation

# First steps

Several options to start with a new Kubernetes cluster:

- [Google Kubernetes Engine (GKE)](https://cloud.google.com/kubernetes-engine/) provided by [Google Cloud](https://cloud.google.com/)
- [Docker Desktop](https://www.docker.com/products/kubernetes)  on Windows and MacOS
- [Minikube](https://github.com/devpro/everyday-cheatsheets/blob/master/docs/minikube.md) on Windows
- [MicroK8s](https://microk8s.io/docs) from Canonical on Ubuntu

[kubectl](https://github.com/devpro/everyday-cheatsheets/blob/master/docs/kubectl.md) is the command line that will manage Kubernetes, running locally in the command line and targetting the Kubernetes API server.

To learn about Kubernetes, it's best to use [kubeadm](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/), a tool to install Kubernetes. To bootstrap a cluster: `kubeadm init` on the one main node then `kubeadm join` on a worker node or another main node.

There are other ways to install Kubernetes: `kubespray`, `kops`.
