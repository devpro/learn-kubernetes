# kubectl (Kubernetes command line tool)

[Kubernetes Documentation/Reference/kubectl CLI](https://kubernetes.io/docs/reference/kubectl/)

> The kubectl command line tool lets you control Kubernetes clusters.

## Quick start

- Cheat sheets: [Official](https://kubernetes.io/docs/reference/kubectl/cheatsheet/) ([Devpro](https://github.com/devpro/everyday-cheatsheets/blob/master/docs/kubectl.md))
- [Cluster Administration > Managing Resources](https://kubernetes.io/docs/concepts/cluster-administration/manage-deployment/)

## Examples

```bash
# get all objects (pods, services, replicasets) having a specific label
k get all --selector env=prod
```

## Plugins

- [Making Kubernetes Operations Easy with kubectl Plugins](https://martinheinz.dev/blog/58) - Oct 1, 2021

## Q&A

### Differences between Apply, Replace and Patch?

- [Atomist - Kubernetes Apply vs. Replace vs. Patch](https://blog.atomist.com/kubernetes-apply-replace-patch/) - May, 2020
