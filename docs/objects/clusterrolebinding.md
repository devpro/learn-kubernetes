# Kubernetes ClusterRoleBinding object

[Kubernetes Documentation/Reference/API Access Control/Using RBAC Authorization](https://kubernetes.io/docs/reference/access-authn-authz/rbac/)

> To grant permissions across a whole cluster, you can use a ClusterRoleBinding.

## Manifest examples

- This cluster role binding allows anyone in the "manager" group to read secrets in any namespace.

```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: read-secrets-global
subjects:
  - kind: Group
    name: manager # Name is case sensitive
    apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: ClusterRole
  name: secret-reader
  apiGroup: rbac.authorization.k8s.io
```

## Command lines examples

```bash
# creates or updates a manifest file containing RBAC objects, and handles deleting and recreating binding objects if required to change the role they refer to
kubectl auth reconcile

# view API discovery roles
kubectl get clusterroles system:discovery -o yaml
```
