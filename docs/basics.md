# Basics of Kubernetes

## Introduction

> Kubernetes (K8s) is an open-source system for automating deployment, scaling, and management of containerized applications

Reference: [kubernetes.io](https://kubernetes.io/)

In other words, Kubernetes is an orchestration system to deploy and manage containers in order to serve decoupled and transcient services.

Kubernetes is the Greek word for Helmsman (or pilot of the ship).

It started as an internal Google product called **Borg**, which have been used during 15 years before being given it to the community (in 2014).

Kubernetes is written in Go Language with an Apache license. Google donated Kubernetes to the [Cloud Native Computing Foundation (CNCF)](https://www.cncf.io/) within The Linux Foundation in July 2015, when Kubernetes reached the v1.0 release.

Read more:

- [Documentation](https://kubernetes.io/docs/home/)
- [GitHub](https://github.com/kubernetes/kubernetes/)
- [Wikipedia](https://en.wikipedia.org/wiki/Kubernetes)

<details>
  <summary>Going further</summary>

  - [Publication - Large-scale cluster management at Google with Borg](https://research.google/pubs/pub43438/)
  - [Goocle Cloud Platform Podcast - Borg and Kubernetes with John Wilkes](https://www.gcppodcast.com/post/episode-46-borg-and-k8s-with-john-wilkes/)
  - [GitHub - Kubernetes community](https://github.com/kubernetes/community)
  - [Slack](https://slack.kubernetes.io/)
  - [StackOverflow](https://stackoverflow.com/search?q=kubernetes)
  - [Microsoft - What is Kubernetes?](https://aka.ms/k8slearning)
</details>

Other solutions for managing containerized applications:

- [Docker Swarm](https://docs.docker.com/engine/swarm/)
- [Apache Mesos](https://mesos.apache.org/)
- [HashiCorp Nomad](https://www.nomadproject.io/)
- [Rancher](https://rancher.com/)

## Main features

Core features:

- Autoscaling
- Load-balancing
- Self-healing

Add-ons features:

- Centralized logging
- Monitoring

## Architecture

### Nodes

<details>
  <summary>High-level view</summary>
 
  Image taken from the original documentation about the [Cloud Controller Manager](https://kubernetes.io/docs/concepts/architecture/cloud-controller/)
  
  <img src="https://d33wubrfki0l68.cloudfront.net/7016517375d10c702489167e704dcb99e570df85/7bb53/images/docs/components-of-kubernetes.png">
</details>

- **Head node(s)** (only Linux, previously named master node(s)): main manager which have several agents, all head nodes constitue the **Control Plane**
  - `kube-apiserver` (frontend): handles all traffic (internal & external), authenticates/validates and forwards API calls (REST operations), persists state in `etcd` (only component to talk to the database)
    <details>
      <summary>Additional information</summary>
  
      - Starting as an alpha feature in v1.16 is the ability to separate user-initiated traffic from server-initiated traffic.
    </details>
    
  - `kube-scheduler`: determines which node will host a Pod (through an algorithm)
  - `etcd`: database/storage system (b+tree key-value store) of the cluster state, container settings, networking configurations
    <details>
      <summary>Additional information</summary>
  
      - Rather than finding and changing an entry, values are always appended to the end. Previous copies of the data are then marked for future removal by a compaction process. It is expected to receive error 409 errors if the value has been updated between while processing a request.
      - There is a master database along with possible followers. While very fast and potentially durable, there have been some hiccups with new tools, such as kubeadm, and features like whole cluster upgrades.
    </details>
    
  - [`kube-controller-manager`](https://kubernetes.io/docs/reference/command-line-tools-reference/kube-controller-manager/): core control loop daemon which interacts with the `kube-apiserver` that regulates the state of the system, responsible for running resource controllers such as Deployments
  - [`cloud-controller-manager`](https://kubernetes.io/docs/tasks/administer-cluster/running-cloud-controller/): interacts with the cloud provider (if cloud-based clusters), managing resources such as load balancers and disk volumes, allows cloud vendors to evolve independently from the core Kubernetes code
- **Worder nodes** (Linux, and Windows since 1.14 release)
  - `kubelet`: receives requests to run the containers, manages any necessary resources and watches over them on the local node, interacts with the local container engine, which is Docker by default, but could be rkt or cri-o
  - `kube-proxy`: creates and manages networking rules to expose the container on the network
  - Container Runtime: Docker, containerd, cri-o, rktlet or any implementation of the Kubernetes [CRI (Container Runtime Interface)](https://github.com/kubernetes/community/blob/master/contributors/devel/sig-node/container-runtime-interface.md)

### API

[API Overview](https://kubernetes.io/docs/concepts/overview/kubernetes-api/) > [API Reference](https://kubernetes.io/docs/reference/kubernetes-api/)

## Terminology / Kubernetes Objects

### Pods

A **Pod** consists of one or more containers (containers are not managed individually). Inside a Pod we have the same IP address, same access to storage and same namespace. It is the smallest unit we can work with.

While Pods are often deployed with one application container in each, a common reason to have multiple containers in a Pod is for logging. You may find the term **Sidecar** (like ambassador and adapter) for a container dedicated to performing a helper task, like handling logs and responding to requests, as the primary application container may not have this ability.

### Controllers

**Controllers** (aka Operators) are a series of watch-loops which makes possible the orchestration through Kubernetes. Each **Controller** interrogates the `kube-apiserver` for a particular object state, modifying the object until the declared state matches the current state. These controllers are compiled into the `kube-controller-manager`.

#### Deployments

**Deployment** is the default controller for containers. It ensures that resources declared in the `PodSpec` are available, such as IP address and storage, and then deploys a `ReplicaSet`.

#### ReplicaSet

The **ReplicaSet** is a controller which deploys and restarts pods, declares to the container engine (Docker by default) to spawn or terminate a container until the requested number is running.

#### Jobs/CronJobs

There are also **Jobs** and **CronJobs** to handle single or recurring tasks, among others. 

### Services

A [Service](https://kubernetes.io/docs/concepts/services-networking/service/) is an "abstract way to expose an application running on a set of Pods as a network service".

**Services** are flexible and scalable agents which connect resources together and will reconnect, should something die and a replacement is spawned. Each Service is a microservice handling a particular bit of traffic, such as a single NodePort or a LoadBalancer to distribute inbound requests among many Pods.

A Service also handles access policies for inbound requests, useful for resource control, as well as for security.

Service types:

- NodePort
- ClusterIP
- LoadBalancer

Read more:

- [Kubernetes NodePort vs LoadBalancer vs Ingress? When should I use what?](https://medium.com/google-cloud/kubernetes-nodeport-vs-loadbalancer-vs-ingress-when-should-i-use-what-922f010849e0)

### Metadata

#### Labels

To make management easier, we can use **Labels**, arbitrary strings which become part of the object metadata.

## Security

### Role-Based Access Control (RBAC)

Introduced in 1.6 as an option when setting up clusters, should be turned on.

_Tip_: execute `kubectl describe pod -n kube-system -l component=kube-apiserver` and look at `--authorization-mode` to see if it's enabled

Kubernetes Objects:

- ClusterRole
- RoleBinding

## Tools

- [Helm](https://github.com/devpro/everyday-cheatsheets/blob/master/docs/helm.md)
- [k14s](https://k14s.io/)
