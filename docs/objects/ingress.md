# Kubernetes Ingress object

> An API object that manages external access to the services in a cluster, typically HTTP. Ingress may provide load balancing, SSL termination and name-based virtual hosting.

→ [Kubernetes Documentation/Concepts/Services, Load Balancing, and Networking/Ingress](https://kubernetes.io/docs/concepts/services-networking/ingress/)

## Controllers

> In order for the Ingress resource to work, the cluster must have an ingress controller running. Unlike other types of controllers which run as part of the kube-controller-manager binary, Ingress controllers are not started automatically with a cluster.

→ [Kubernetes Documentation/Concepts/Services, Load Balancing, and Networking/Ingress Controllers](https://kubernetes.io/docs/concepts/services-networking/ingress-controllers/)

### NGINX Ingress Controller

* [documentation](https://kubernetes.github.io/ingress-nginx/)
* [source code](https://github.com/kubernetes/ingress-nginx)
* [v1.0.0](https://github.com/kubernetes/ingress-nginx/releases/tag/controller-v1.0.0) - August 24, 2021

### Kong Ingress Controller

* [Kong for Kubernetes](https://konghq.com/solutions/kubernetes-ingress/)
* [APM With Prometheus and Grafana on Kubernetes Ingress](https://konghq.com/blog/prometheus-grafana-kubernetes/) - September 21, 2021

## Command line examples

```bash
k get all -A

k get ing -A

k edit ing ingress
```

## Manifest examples

```yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: minimal-ingress
  annotations:
    nginx.ingress.kubernetes.io/rewrite-target: /
spec:
  rules:
  - http:
      paths:
      - path: /testpath
        pathType: Prefix
        backend:
          service:
            name: test
            port:
              number: 80
```
