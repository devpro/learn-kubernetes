# Kind

> kind is a tool for running local Kubernetes clusters using Docker container “nodes”. kind was primarily designed for testing Kubernetes itself, but may be used for local development or CI.

🌐 [kind.sigs.k8s.io](https://kind.sigs.k8s.io/), [code](https://github.com/kubernetes-sigs/kind/)

## CLI

```bash
# makes sure kind is available from the command line
kind version

# creates a cluster
kind create cluster

# gets clusters
kind get clusters

# sets kubectl context
kubectl cluster-info --context kind-kind

# looks at images
docker exec -it my-node-name crictl images

# builds an image
docker build -t my-custom-image:unique-tag ./my-image-dir
kind load docker-image my-custom-image:unique-tag
kubectl apply -f my-manifest-using-my-image:unique-tag

# deletes a cluster
kind delete cluster
```

## Use cases

### WSL2

- Follow [Using WSL2](https://kind.sigs.k8s.io/docs/user/using-wsl2/)

- Create the cluster config file

```yaml
# cluster-config.yml
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
- role: control-plane
  extraPortMappings:
  - containerPort: 30000
    hostPort: 30000
    protocol: TCP
```

- Workaround on Ubuntu 20.04 to fix the error while creating the cluster (see [issue #2323](https://github.com/kubernetes-sigs/kind/issues/2323))

```bash
kind create cluster --config=cluster-config.yml --image kindest/node:v1.17.17
```

### NGINX Ingress Controller

- [LoadBalancer Services using Kubernetes in Docker](https://medium.com/groupon-eng/loadbalancer-services-using-kubernetes-in-docker-kind-694b4207575d) by Owain Williams
- September 20, 2022
