# Kubernetes ClusterRole object

[Kubernetes Documentation/Reference/API Access Control/Using RBAC Authorization](https://kubernetes.io/docs/reference/access-authn-authz/rbac/)

## Manifest examples

- A ClusterRole that can be used to grant read access to secrets in any particular namespace, or across all namespaces (depending on how it is bound):

```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  # "namespace" omitted since ClusterRoles are not namespaced
  name: secret-reader
rules:
  - apiGroups: [""]
    # at the HTTP level, the name of the resource for accessing Secret objects is "secrets"
    resources: ["secrets"]
    verbs: ["get", "watch", "list"]
```
