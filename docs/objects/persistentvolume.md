# Kubernetes PersistentVolume object

A **PersistentVolume** is a piece of storage in the cluster that has been provisioned by an administrator or dynamically provisioned using Storage Classes. It is a resource in the cluster just like a node is a cluster resource.

Reference: [Kubernetes Documentation/Concepts/Storage/Persistent Volumes](https://kubernetes.io/docs/concepts/storage/persistent-volumes/)

## Command line examples

```bash
k get pv
```

## Manifest examples

- Create a 'Persistent Volume' with storage: 100Mi, access modes: ReadWriteMany, host path: /pv/log

```yaml
apiVersion: v1
kind: PersistentVolume
metadata:
  name: pv-log
spec:
  capacity:
    storage: 100Mi
  accessModes:
  - ReadWriteMany
  hostPath:
    path: /pv/log
```
