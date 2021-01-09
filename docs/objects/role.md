# Kubernetes Role object

[Kubernetes Documentation/Reference/API Access Control/Using RBAC Authorization](https://kubernetes.io/docs/reference/access-authn-authz/rbac/)

> A Role always sets permissions within a particular namespace; when you create a Role, you have to specify the namespace it belongs in.

## Command line examples

```bash
k get roles

# create a role
kubectl create role developer --verb=get --verb=create --verb=list --verb=delete --resource=pods

k edit role developer -n blue
```

## Manifest examples

```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  namespace: default
  name: pod-reader
rules:
  - apiGroups: [""] # "" indicates the core API group
    resources: ["pods"]
    verbs: ["get", "watch", "list"]
```
