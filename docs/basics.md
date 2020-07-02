# Basics of Kubernetes

## Introduction

Kubernetes is the greek word for Helmsman, or pilot of the ship. It started as an internal Google product called Borg, they have been working with it during 15 years before giving it to the community (in 2014).

As mentionned in the official website [kubernetes.io](https://kubernetes.io/), "Kubernetes (K8s) is an open-source system for automating deployment, scaling, and management of containerized applications." (in other words an orchestration system to deploy and manage containers).

Keeping with the maritime theme of Docker containers, Kubernetes is the pilot of a ship of containers and is all about decoupled, transcient services.

Kubernetes is written in Go Language, it is an open source software with an Apache license. Google donated Kubernetes to the Cloud Native Computing Foundation (CNCF) within The Linux Foundation in July 2015, when Kubernetes reached the v1.0 release.

Going further:

- Read more on [wikipedia](https://en.wikipedia.org/wiki/Kubernetes).
- View the source code on [GitHub](https://github.com/kubernetes/kubernetes/).
- Start with the [documentation](https://kubernetes.io/docs/home/)

Other solutions for managing containerized applications:

- [Docker Swarm](https://docs.docker.com/engine/swarm/)
- [Apache Mesos](https://mesos.apache.org/)
- [HashiCorp Nomad](https://www.nomadproject.io/)
- [Rancher]((https://rancher.com/)

## Architecture

Image taken from the original documentation about the [Cloud Controller Manager](https://kubernetes.io/docs/concepts/architecture/cloud-controller/)

<img src="https://d33wubrfki0l68.cloudfront.net/7016517375d10c702489167e704dcb99e570df85/7bb53/images/docs/components-of-kubernetes.png">

- Central manager (only Linux)
  - API server
  - Scheduler
  - Controllers
  - Storage system: state of the cluster, container settings, networking configurations
- Worder nodes (Linux, and Windows since 1.14 release)
  - kubelet: receives requests to run the containers, manages any necessary resources and watches over them on the local node, interacts with the local container engine, which is Docker by default, but could be rkt or cri-o
  - kube-proxy: creates and manages networking rules to expose the container on the network

## Terminology

### Pod

Containers are not managed individually; instead, they are part of a larger object called a Pod.

A Pod consists of one or more containers which share an IP address, access to storage and namespace.

### Controllers

Orchestration is managed through a series of watch-loops, or controllers. Each controller interrogates the kube-apiserver for a particular object state, modifying the object until the declared state matches the current state. These controllers are compiled into the kube-controller-manager.

#### Deployment

The default controller for containers is a Deployment. A Deployment ensures that resources declared in the PodSpec are available, such as IP address and storage, and then deploys a ReplicaSet.

#### ReplicaSet

The ReplicaSet is a controller which deploys and restarts pods, which declares to the container engine, Docker by default, to spawn or terminate a container until the requested number is running.

#### Jobs/CronJobs

There are also Jobs and CronJobs to handle single or recurring tasks, among others. 

### Metadata

#### Labels

To make management easier, we can use labels, arbitrary strings which become part of the object metadata.

## Tools

- Minikube
- kubeadm
- kubectl
- Helm
- Kompose

## Resources

- [Publication - Large-scale cluster management at Google with Borg](https://research.google/pubs/pub43438/)
- [Goocle Cloud Platform Podcast - Borg and Kubernetes with John Wilkes](https://www.gcppodcast.com/post/episode-46-borg-and-k8s-with-john-wilkes/)
- [GitHub - Kubernetes community](https://github.com/kubernetes/community)
- [Slack](https://slack.kubernetes.io/)
- [StackOverflow](https://stackoverflow.com/search?q=kubernetes)
