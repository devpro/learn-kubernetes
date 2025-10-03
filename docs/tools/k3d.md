# k3d

> k3d is a lightweight wrapper to run k3s (Rancher Lab’s minimal Kubernetes distribution) in docker

[k3d.io](https://k3d.io/), [code](https://github.com/k3d-io/k3d)

## Installation

- Download & install latest release (ref. [Install current latest release](https://k3d.io/stable/#install-current-latest-release))

```bash
wget -q -O - https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash
```

## Basic commands

Command                          | Action
---------------------------------|------------------
`k3d cluster create <mycluster>` | Create a cluster
`k3d cluster list`               | List the clusters
`k3d cluster stop <mycluster>`   | Stops a cluster
`k3d cluster start <mycluster>`  | Starts a cluster
`k3d cluster delete <mycluster>` | Delete a cluster

## Getting started

- Create a cluster

```bash
# creates a cluster
k3d cluster create mycluster -p "8081:80@loadbalancer" -p "8082:443@loadbalancer" --agents 2

# displays cluster information (kubectl configuration is automatically updated and set to use the new cluster context)
kubectl cluster-info

# ensures coredns and traefik (ingress controller) are deployed by default (k3s behavior)
kubectl get deploy -n kube-system

# (optional) writes and uses specific kubectl configuration
export KUBECONFIG="$(k3d kubeconfig write mycluster)"
```

- Deploy a basic workflow (ref. [Exposing Services](https://k3d.io/v5.1.0/usage/exposing_services/))

```bash
# creates a nginx (web server) deployment
kubectl create deployment nginx --image=nginx

# exposes the deployment with a service
kubectl create service clusterip nginx --tcp=80:80

# provides an ingress to the service
cat <<EOF | kubectl apply -f -
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: nginx
  annotations:
    ingress.kubernetes.io/ssl-redirect: "false"
spec:
  rules:
    - host: nginx.dev.local
      http:
        paths:
          - path: /
            pathType: Prefix
            backend:
              service:
                name: nginx
                port:
                  number: 80
EOF

# checks everything is ok
kubectl get svc,pod,deploy,ingress

# makes sure the website can be reached
curl localhost:8081/
```

- Update `hosts` file

```hosts
127.0.0.1  nginx.dev.local
```

- Make sure ingress is working

```bash
curl nginx.dev.local:8081/
```

- Clean-up

```bash
# deletes the cluster
k3d cluster delete mycluster
```

## Advanced usage

- [Kubernetes - K3D with Load Balancer](https://niehaitao.github.io/ops/ops-k3d-lb/)

- CoreDNS configuration

```bash
# displays coredns configmap
kubectl -n kube-system get configmap coredns -o yaml
```
