# Kubernetes Deployment object

[Kubernetes Documentation/Concepts/Workloads/Workload Resources/Deployments](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/)

## Presentation

**Deployment** is the default controller for containers. It ensures that resources declared in the `PodSpec` are available, such as IP address and storage, and then deploys a `ReplicaSet`.

## Manifest examples

- `maxSurge` sets the maximum number of excess Pods
- `maxUnavailable` sets the maximum number of unavailable Pods

```yaml
apiVersion: extensions/v1beta1
kind: Deployment
spec:
  replicas: 10
  strategy:
    type: RollingUpdate
    rollingUpdate:
      maxSurge: 20%
      maxUnavailable: 3
```
