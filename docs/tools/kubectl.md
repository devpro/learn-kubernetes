# kubectl (Kubernetes CLI)

> Command line tool for communicating with a Kubernetes cluster's control plane, using the [Kubernetes API](https://kubernetes.io/docs/reference/command-line-tools-reference/kube-apiserver/).

[kubernetes.io/docs/reference/kubectl](https://kubernetes.io/docs/reference/kubectl/), [kubectl Quick Reference](https://kubernetes.io/docs/reference/kubectl/quick-reference/)

## Quick start

- Convention

```bash
kubectl <action> <object_type> <arguments>
```

- Common cases

Command                                         | Action
------------------------------------------------|----------------------------------------------------------------------------------
`kubectl apply -f <manifest_file>.yaml`         | Apply the Kubernetes definition written in a manifest file (YAML)
`kubectl cluster-info --context <context_name>` | Display Kubernetes cluster information for a given context (see config.json file)
`kubectl get nodes`                             | Displays Kubernetes cluster nodes
`kubectl get ns`                                | Displays namespaces

## Examples

Get all objects (pods, services, replicasets) having a specific label

```bash
kubectl get all --selector env=prod
```

Deploy a nginx web server:

```bash
# creates a deployment based on nginx image
kubectl create deployment nginx --image=nginx --port=80

# exposes the service through a nodeport on port 30000
kubectl create service nodeport nginx --tcp=80:80 --node-port=30000

# displays all objects
kubectl get all

# accesses the website (should work from WSL and Windows)
curl localhost:30000

# cleans-up
kubectl delete svc,deploy nginx
```

## Plugins

- [Making Kubernetes Operations Easy with kubectl Plugins](https://martinheinz.dev/blog/58) - Oct 1, 2021

## Q&A

### Differences between Apply, Replace and Patch?

- [Atomist - Kubernetes Apply vs. Replace vs. Patch](https://blog.atomist.com/kubernetes-apply-replace-patch/) - May, 2020
