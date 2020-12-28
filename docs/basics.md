# Kubernetes basics

> **Kubernetes** (K8s) is an open-source system for automating deployment, scaling, and management of containerized applications [(kubernetes.io)](https://kubernetes.io/)

## Introduction

Kubernetes is an orchestration system to deploy and manage containers in order to serve decoupled and transcient services.

### History

Kubernetes, Greek word for Helmsman (or pilot of the ship), has been created by Google from their experience on internal Google products called [**Borg**](https://research.google/pubs/pub43438/), which has been used during 15 years, and [**Omega**](https://research.google/pubs/pub41684/) (know more by listening to [GCP Podcast episode](https://www.gcppodcast.com/post/episode-46-borg-and-k8s-with-john-wilkes/)).

Kubernetes is written in Go language, with the Apache license.

Google donated Kubernetes to the [Cloud Native Computing Foundation (CNCF)](https://www.cncf.io/) within The Linux Foundation in July 2015, when Kubernetes reached the v1.0 release.

Read more:

- [Documentation](https://kubernetes.io/docs/home/) ([Glossary](https://kubernetes.io/docs/reference/glossary/?all=true#term-manifest), [Wikipedia](https://en.wikipedia.org/wiki/Kubernetes))
- [GitHub](https://github.com/kubernetes/kubernetes/) ([Community](https://github.com/kubernetes/community), [Slack](https://slack.kubernetes.io/), [StackOverflow](https://stackoverflow.com/search?q=kubernetes))
- [What is Kubernetes? (by Microsoft)](https://aka.ms/k8slearning)
- [Releases](./releases.md)

### Competitors

Other solutions to manage containerized applications:

- [Docker Swarm](https://docs.docker.com/engine/swarm/)
- [Apache Mesos](https://mesos.apache.org/)
- [HashiCorp Nomad](https://www.nomadproject.io/)
- [Rancher](https://rancher.com/)

### Main features

Core features:

- Autoscaling
- Service discovery & Load-balancing
- Self-healing
- Secret & Configuration management
- Automatic rollbacks & Rollouts
- Batch execution

Add-ons features:

- Centralized logging
- Monitoring

Read more:

- [Bilgin Ibryam - Designing Cloud Native Applications With kubernetes](https://www.slideshare.net/bibryam/designing-cloud-native-applications-with-kubernetes)

## Design & Architecture

[Community > Kubernetes Design and Architecture](https://github.com/kubernetes/community/blob/master/contributors/design-proposals/architecture/architecture.md)

### Nodes

- [Nodes](./objects/node.md)

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
  - `kubelet`: receives requests to run the containers, manages any necessary resources and watches over them on the local node, interacts with the local container engine, which is `Docker` by default, but could be `containerd` or `cri-o` (or any implementation of the Kubernetes [CRI (Container Runtime Interface)](https://github.com/kubernetes/community/blob/master/contributors/devel/sig-node/container-runtime-interface.md))
  - [`kube-proxy`](https://kubernetes.io/docs/reference/command-line-tools-reference/kube-proxy/): creates and manages networking rules to expose the container on the network
    - 3 proxy-modes: 'userspace' (older) or 'iptables' (faster) or 'ipvs' (or 'kernelspace' for Windows)

<details>
  <summary>Overview of CRI</summary>

  Image taken from Kubernetes blog post [Introducing Container Runtime Interface (CRI) in Kubernetes](https://kubernetes.io/blog/2016/12/container-runtime-interface-cri-in-kubernetes/)
  
  <img src="https://d1sz9tkli0lfjq.cloudfront.net/items/0I3X2U0S0W3r1D1z2O0Q/Image%202016-12-19%20at%2017.13.16.png">
</details>

### Pods

- [Pods](./objects/pod.md)

### Networking

- [Services](./objects/service.md)

<details>
  <summary>Readings</summary>

  - [Deconstructing Kubernetes Networking](https://eevans.co/blog/deconstructing-kubernetes-networking/)
  - [Understanding Kubernetes Interfaces: CRI, CNI, and CSI ](https://dzone.com/articles/understanding-kubernetes-interfaces-cri-cni-amp-cs)
  - [Kubernetes Network Plugins](https://kubedex.com/kubernetes-network-plugins/)

</details>

### Container Storage

[Container Storage Interface (CSI) Specification](https://github.com/container-storage-interface/spec) ([Understanding the Container Storage Interface (CSI)](https://medium.com/google-cloud/understanding-the-container-storage-interface-csi-ddbeb966a3b))

### API

[API Overview](https://kubernetes.io/docs/concepts/overview/kubernetes-api/) > [API Reference](https://kubernetes.io/docs/reference/kubernetes-api/)

### Controllers

[Kubernetes Documentation/Concepts/Cluster Architecture/Controllers](https://kubernetes.io/docs/concepts/architecture/controller/)

**Controllers** are a series of watch-loops which makes possible the orchestration through Kubernetes. Each **Controller** interrogates the `kube-apiserver` for a particular object state, modifying the object until the declared state matches the current state. These controllers are compiled into the `kube-controller-manager`.

Samples: [kubernetes/sample-controller](https://github.com/kubernetes/sample-controller)

#### Built-in controllers

- [CronJobs](./objects/cronjob.md)
- [DaemonSet](./objects/daemonset.md)
- [Deployments](./objects/deployment.md)
- [Jobs](./objects/job.md)
- [ReplicaSets](./objects/replicaset.md)
- [StatefulSet](./objects/statefulset.md)

#### Operators

[Kubernetes Documentation/Concepts/Extending Kubernetes/Operator pattern](https://kubernetes.io/docs/concepts/extend-kubernetes/operator/)

An operator is a domain specific controller.

See [Stackoverflow answer](https://stackoverflow.com/questions/47848258/kubernetes-controller-vs-kubernetes-operator#47857073), [page on Octetz](https://octetz.com/docs/2019/2019-10-13-controllers-and-operators/), [GitHub issue](https://github.com/kubeflow/tf-operator/issues/300) and [CoreOS definition](https://coreos.com/operators/).

### Configuration

- [Configuration Best Practices](https://kubernetes.io/docs/concepts/configuration/overview/)
- [ConfigMaps](./objects/configmap.md)
- [Secrets](./objects/secret.md)

#### Container runtime

Reference: [Documentation / Getting started / Production environment / Container runtimes](https://kubernetes.io/docs/setup/production-environment/container-runtimes/)

Kubernetes uses a container runtime to run containers in Pods. There are mainly 3:

- [Docker engine](https://docs.docker.com/engine/) is the default container runtime for Kubernetes
- [CRI-O](https://cri-o.io/) ([cri-o/cri-o](https://github.com/cri-o/cri-o))
  - [Awesome CRI-O](https://github.com/cri-o/cri-o/blob/master/awesome.md)
- [containerd](https://containerd.io/) ([containerd/containerd](https://github.com/containerd/containerd))

_Note_: [rktlet](https://github.com/kubernetes-retired/rktlet) and [rkt](https://github.com/rkt/rkt) projects have been ended

<details>
  <summary>Container layers</summary>
 
  Image taken from Docker blog post [What is containerd?](https://www.docker.com/blog/what-is-containerd-runtime/)
  
  <img src="https://i0.wp.com/www.docker.com/blog/wp-content/uploads/974cd631-b57e-470e-a944-78530aaa1a23-1.jpg?w=906&ssl=1">
</details>

#### Containerized image

The [Open Container Initiative (OCI)](https://opencontainers.org/) is an open governance structure for the express purpose of creating open industry standards around container formats and runtimes. Source repositories are managed inside [opencontainers](https://github.com/opencontainers) GitHub organization.

There are currently two specifications:

- [Runtime Specification (runtime-spec)](https://github.com/opencontainers/runtime-spec)
- [Image Specification (image-spec)](https://github.com/opencontainers/image-spec)

Docker donated [runC](https://github.com/opencontainers/runc) to OCI.

### Probes

Probe type | Reason
---------- | ------
**Readiness** | Make sure the application is ready to accept traffic
**Liveness** | Make sure the application is running ok

### Metadata

#### Labels

To make management easier, we can use **Labels**, arbitrary strings which become part of the object metadata.

**Label selectors** are a very powerful way to get the Kubernetes objects we want to interact with.

```bash
kubectl get pod -n <namespace> --selector app=<application-name>
```

### Storage

- [Persistent Volumes](./docs/objects/persistentvolume.md)
- [Persistent Volume Claims](./docs/objects/persistentvolumeclaim.md)

## Security

### Role-Based Access Control (RBAC)

Introduced in 1.6 as an option when setting up clusters, should be turned on.

_Tip_: execute `kubectl describe pod -n kube-system -l component=kube-apiserver` and look at `--authorization-mode` to see if it's enabled

Kubernetes Objects:

- ClusterRole
- RoleBinding

## Tools

- [Helm](https://github.com/devpro/everyday-cheatsheets/blob/master/docs/helm.md): "The package manager for Kubernetes"

- [Carvel (previously k14s)](https://k14s.io/): "A set of reliable, single-purpose, composable tools that aid in your application building, configuration, and deployment to Kubernetes"

- [k9s](https://github.com/derailed/k9s): "Kubernetes CLI To Manage Your Clusters In Style!"

- [Lens](https://k8slens.dev/): "Lens is the only IDE you’ll ever need to take control of your Kubernetes clusters. It's open source and free."

Others: [Red Hat - 10 awesome k8s tools every user should know](https://docs.google.com/presentation/d/13k-Lhc-tVgUohrtKqAYIikaQCTsmuzzjhOe_hpwgUgw/edit#slide=id.g91ee8ae7fb_0_228)
