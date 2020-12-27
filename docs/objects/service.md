# Kubernetes Service object

A [Service](https://kubernetes.io/docs/concepts/services-networking/service/) is an "abstract way to expose an application running on a set of Pods as a network service".

**Services** are flexible and scalable agents which connect resources together and will reconnect, should something die and a replacement is spawned. Each Service is a microservice handling a particular bit of traffic, such as a single NodePort or a LoadBalancer to distribute inbound requests among many Pods.

A Service also handles access policies for inbound requests, useful for resource control, as well as for security.

Service types:

- NodePort
- ClusterIP
- LoadBalancer

## Command line arguments

```bash
# get all services
kubectl get svc
```

## Going further

- [Kubernetes NodePort vs LoadBalancer vs Ingress? When should I use what?](https://medium.com/google-cloud/kubernetes-nodeport-vs-loadbalancer-vs-ingress-when-should-i-use-what-922f010849e0)
