# Storage Class

Reference: [Kubernetes Documentation/Concepts/Storage/Storage Classes](https://kubernetes.io/docs/concepts/storage/storage-classes/)

## Command line examples

```bash
k get sc
```

## Manifest examples

- Create a new StorageClass

```yaml
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  name: delayed-volume-sc
provisioner: kubernetes.io/no-provisioner
volumeBindingMode: WaitForFirstConsumer
```

- Create a new PersistentVolumeClaim that should bind to an existing volume (look at volume class name, access mode and storage)

```yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: local-pvc
spec:
  storageClassName: local-storage
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 500Mi
```
