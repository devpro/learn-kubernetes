# Kubernetes PersistentVolumeClaim object

A **PersistentVolumeClaim** is a request for storage by a user. It is similar to a Pod. Pods consume node resources and PVCs consume PV resources.

Reference: [Kubernetes Documentation/Concepts/Storage/Persistent Volumes](https://kubernetes.io/docs/concepts/storage/persistent-volumes/)

## Command line examples

```bash
k get pvc
```

## Manifest examples

- Create a new PersistentVolumeClaim

```yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: claim-log-1
spec:
  accessModes:
    - ReadWriteMany
  resources:
    requests:
      storage: 50Mi
```

- Use PVC in pod

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: task-pv-pod
spec:
  volumes:
    - name: task-pv-storage
      persistentVolumeClaim:
        claimName: task-pv-claim
  containers:
    - name: task-pv-container
      image: nginx
      ports:
        - containerPort: 80
          name: "http-server"
      volumeMounts:
        - mountPath: "/usr/share/nginx/html"
          name: task-pv-storage
```
