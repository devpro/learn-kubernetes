# Kubernetes ServiceAccount object

[Kubernetes Documentation/Tasks/Configure Pods and Containers/Configure Service Accounts for Pods](https://kubernetes.io/docs/tasks/configure-pod-container/configure-service-account/)

> A **service account** provides an identity for processes that run in a Pod.

## Command line examples

```bash
# every namespace has a default service account resource called default. You can list this and any other serviceAccount resources in the namespace with this command
kubectl get serviceaccounts
```
