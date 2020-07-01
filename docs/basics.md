# Basics of Kubernetes

## Introduction

Kubernetes is the greek word for Helmsman, or pilot of the ship. It started as an internal Google product called Borg, they have been working with it during 15 years before giving it to the community.

Main website is [kubernetes.io][https://kubernetes.io/). As mentionned in the website, "Kubernetes (K8s) is an open-source system for automating deployment, scaling, and management of containerized applications.".

Keeping with the maritime theme of Docker containers, Kubernetes is the pilot of a ship of containers and is all about decoupled, transcient services.

Kubernetes is written in Go Language.

Read more on [wikipedia](https://en.wikipedia.org/wiki/Kubernetes).

Other solutions for managing containerized applications:

- Docker Swarm
- Apache Mesos
- Nomad
- Rancher

## Architecture

Image taken from the original documentation about the [Cloud Controller Manager](https://kubernetes.io/docs/concepts/architecture/cloud-controller/)

<img src="https://d33wubrfki0l68.cloudfront.net/7016517375d10c702489167e704dcb99e570df85/7bb53/images/docs/components-of-kubernetes.png">
