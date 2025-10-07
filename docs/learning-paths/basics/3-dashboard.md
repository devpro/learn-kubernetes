# Kubernetes dashboard

## Documentation

- [Deploy and Access the Kubernetes Dashboard](https://kubernetes.io/docs/tasks/access-application-cluster/web-ui-dashboard/)
- [Understanding Kubernetes Objects](https://kubernetes.io/docs/concepts/overview/working-with-objects/kubernetes-objects/)
- [Workloads](https://kubernetes.io/docs/concepts/workloads/)

## Exercise

### Success criteria

- [ ] Display the dashboard in your browser
- [ ] Login to the dashboard
- [ ] Switch to `kube-system` namespace and look at the different Kubernetes objects

### Help

- Create a user (ref. [Creating sample user](https://github.com/kubernetes/dashboard/blob/master/docs/user/access-control/creating-sample-user.md)):

```yaml title="dashboard-adminuser.yaml"
---
apiVersion: v1
kind: ServiceAccount
metadata:
  name: admin-user
  namespace: kubernetes-dashboard
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: admin-user
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: cluster-admin
subjects:
  - kind: ServiceAccount
    name: admin-user
    namespace: kubernetes-dashboard
```

## Knowledge assessment

- [ ] namespace
- [ ] pod
- [ ] replicaset
- [ ] job
- [ ] deployment
- [ ] cronjob
- [ ] daemonset

## Next

Jump to next section: [4. Deployments](4-deployments.md)
