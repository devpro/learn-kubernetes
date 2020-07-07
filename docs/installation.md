# Installation

## Quick start

Several options to start with a new Kubernetes cluster:

- Managed Kubernetes Services
  - [Google Kubernetes Engine (GKE)](https://cloud.google.com/kubernetes-engine/) provided by [Google Cloud](https://cloud.google.com/)
  - Amazon Elastic Container Service for Kubernetes (EKS)
  - Azure Kubernetes Service (AKS)
  - RedHat OpenShift
- [Docker Desktop](https://www.docker.com/products/kubernetes)  on Windows and MacOS
- [Minikube](https://github.com/devpro/everyday-cheatsheets/blob/master/docs/minikube.md) on all machines
- [MicroK8s](https://microk8s.io/docs) from Canonical on Ubuntu
- [K3s](https://k3s.io/) from Rancher on small devices or CI pipelines
- [Kind (Kubernetes in Docker)](https://kind.sigs.k8s.io/): fast and easy testing of clusters

### Kubernetes CLI

[kubectl](https://github.com/devpro/everyday-cheatsheets/blob/master/docs/kubectl.md) is the command line that will manage Kubernetes, running locally in the command line and targetting the [Kubernetes API server](https://kubernetes.io/docs/reference/command-line-tools-reference/kube-apiserver/).

## Cluster creation

### General thought

- [Picking the Right Solution](https://pwittrock.github.io/docs/setup/pick-right-solution/)

### Deployment configurations

- Single-node
- Single head node, multiple workers
- Multiple head nodes with HA, multiple workers
- HA etcd, HA head nodes, multiple workers

### Network

Networking is a central part of Kubernetes, but it can be challenging to understand exactly how it is expected to work. There are 4 distinct networking problems to address:

- Highly-coupled container-to-container communications
- Pod-to-Pod communications
- Pod-to-Service communications
- External-to-Service communications

Reference: [Documentation > Concepts > Cluster Administration > Cluster Networking](https://kubernetes.io/docs/concepts/cluster-administration/networking/)

A network must be defined to manage the cluster and avoid any IP conflict. Available plugins may implement [Container Network Interface (CNI)](https://github.com/devpro/kubernetes-certification-2020/blob/master/docs/projects.md#container-network-interface-cni), a CNCF project.

4 choices for pod networking:

- [Calico](https://www.projectcalico.org/)
- [Flannel](https://github.com/coreos/flannel)
- [Kube-Router](https://www.kube-router.io/)
- [Romana](https://github.com/romana/romana)
- [Weave Net](https://www.weave.works/oss/net/)

### Tools

3 choices:

- [kubeadm](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/): boostrap quickly a cluster (appeared in v1.4, stabe & HA with V1.15)
- [kops](https://kubernetes.io/docs/setup/production-environment/tools/kops/)
- [kubespray](https://kubernetes.io/docs/setup/production-environment/tools/kubespray/)

#### kubeadm

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

### Configuration management systems

See recipes with Ansible, Chef, Puppet, Terraform.

### No tools involved

Kubernetes The Hard Way by Kelsey Hightower: [GitHub](https://github.com/kelseyhightower/kubernetes-the-hard-way)

### Hyperkube

As of July of 2020, Kyperkube seems deprecated. The image build has been removed from Kubernetes base images, see [PR#88676](https://github.com/kubernetes/kubernetes/pull/88676).
