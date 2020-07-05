# Installation

## Quick start

Several options to start with a new Kubernetes cluster:

- [Google Kubernetes Engine (GKE)](https://cloud.google.com/kubernetes-engine/) provided by [Google Cloud](https://cloud.google.com/)
- [Docker Desktop](https://www.docker.com/products/kubernetes)  on Windows and MacOS
- [Minikube](https://github.com/devpro/everyday-cheatsheets/blob/master/docs/minikube.md) on Windows
- [MicroK8s](https://microk8s.io/docs) from Canonical on Ubuntu

## Kubernetes CLI

[kubectl](https://github.com/devpro/everyday-cheatsheets/blob/master/docs/kubectl.md) is the command line that will manage Kubernetes, running locally in the command line and targetting the Kubernetes API server.

## Build a cluster

3 options:

- [kubeadm](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/): boostrap quickly a cluster (appeared in v1.4, stabke and HA with V1.15)
- [kops](https://kubernetes.io/docs/setup/production-environment/tools/kops/)
- [kubespray](https://kubernetes.io/docs/setup/production-environment/tools/kubespray/)

### kubeadm

> Kubeadm is a tool built to provide best-practice "fast paths" for creating Kubernetes clusters. It performs the actions necessary to get a minimum viable, secure cluster up and running in a user friendly way. Kubeadm's scope is limited to the local node filesystem and the Kubernetes API, and it is intended to be a composable building block of higher level tools.

Reference: [GitHub](https://github.com/kubernetes/kubeadm)

<details>
  <summary>Usual commands</summary>
 
  ```bash
  # bootstrap the initial Kubernetes control-plane node -> will return a token and a SHA256 hash
  kubeadm init
  
  # (optional) create a network manually or with kubectl create -f
  
  # bootstrap a Kubernetes worker node or an additional control plane node, and join it to the cluster
  kubeadm join --token <token> <control-plane-host>:<control-plane-port> --discovery-token-ca-cert-hash sha256:<hash>
  
  # upgrade a Kubernetes cluster to a newer version
  kubeadm upgrade
  
  # revert any changes made to this host by kubeadm init or kubeadm join
  kubeadm reset
  ```
</details>
