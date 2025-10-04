# k3d

> k3d is a lightweight wrapper to run k3s (Rancher Lab’s minimal Kubernetes distribution) in docker

🌐 [k3d.io](https://k3d.io/), [code](https://github.com/k3d-io/k3d)

## Installation

🌐 [k3d.io/installation](https://k3d.io/stable/#installation)

Install the latest release:

```bash
wget -q -O - https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash
```

## Common commands

Command                     | Action
----------------------------|-------------------
`k3d cluster create <name>` | Creates a cluster
`k3d cluster list`          | Lists the clusters
`k3d cluster stop <name>`   | Stops a cluster
`k3d cluster start <name>`  | Starts a cluster
`k3d cluster delete <name>` | Deletes a cluster

## Getting started

### Quick walkthrough with the default parameters

Create a single node cluster:

```bash
k3d cluster create mycluster
```

> [!NOTE]
> Note: kubectl configuration (`~/.kube/config`) is automatically updated and set to use the new cluster context, look at [handling kubeconfigs](https://k3d.io/stable/usage/kubeconfig/) for more options

Display cluster information:

```bash
kubectl cluster-info
kubectl get nodes
kubectl get deploy -n kube-system
kubectl get sc
kubectl get ingressclass
```

> [!NOTE]
> Note: coredns, local-path-provisioner, metrics-server, traefik are deployed by default

Finally, when we're done, delete the cluster and remove the configuration:

```bash
k3d cluster delete mycluster
```

### Two worker nodes cluster with ingresses

🌐 [Exposing Services](https://k3d.io/stable/usage/exposing_services/)

Create the cluster and expose HTTP/HTTPS ports:

```bash
k3d cluster create mycluster -p "8081:80@loadbalancer" -p "8082:443@loadbalancer" --agents 2
```

Install NGINX in the cluster:

```bash
kubectl create ns nginx
kubectl create deployment nginx --image=nginx -n nginx
kubectl create service clusterip nginx --tcp=80:80 -n nginx
cat <<EOF | kubectl apply -n nginx -f -
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: nginx
  annotations:
    ingress.kubernetes.io/ssl-redirect: "false"
spec:
  rules:
  - http:
      paths:
      - path: /
        pathType: Prefix
        backend:
          service:
            name: nginx
            port:
              number: 80
EOF
```

Check everything is ok:

```bash
kubectl get svc,pod,deploy,ingress -nginx
curl localhost:8081/
```

Open [localhost:8081](http://localhost:8081) in a browser.

Clean-up everything:

```bash
kubectl delete ns nginx
k3d cluster delete mycluster
```

### Play a game on internet from a local cluster with ngrok

Create the cluster and expose HTTP/HTTPS ports:

```bash
k3d cluster create mycluster --agents 1
```

Deploy [ngrok Kubernetes Operator](https://kwt.devpro.fr/application-guides/networking/ngrok.html).

Create a domain in ngrok dashboard and set the value for `NGROK_DOMAIN`.

Install the game in the cluster:

```bash
kubectl create ns demo
wget -O- -q https://raw.githubusercontent.com/devpro/tech-notes/main/samples/kubernetes/manifests/game-2048.yml \
| sed -e 's/XXX_INGRESS_CLASS/ngrok/g' \
| sed -e "s/XXX_DOMAIN/$NGROK_DOMAIN/g" \
| kubectl apply -n demo -f -
```

Check everything is ok:

```bash
kubectl get svc,pod,deploy,ingress -n demo
curl -L $NGROK_DOMAIN
```

Open "NGROK_DOMAIN" in a browser.

Clean-up everything:

```bash
kubectl delete ns demo
k3d cluster delete mycluster
```

## Tips

Look at the configuration of CoreDNS:

```bash
kubectl -n kube-system get configmap coredns -o yaml
```

Optionally, write and use specific kubectl configuration:

```bash
export KUBECONFIG="$(k3d kubeconfig write mycluster)"
```

[Create Trafik V2 load balancer on a K3D kubernetes](https://niehaitao.github.io/ops/ops-k3d-lb/)
