# Kubernetes ReplicaSet object

[Kubernetes Documentation/Concepts/Workloads/Workload Resources/ReplicaSet](https://kubernetes.io/docs/concepts/workloads/controllers/replicaset/)

The **ReplicaSet** is a controller which deploys and restarts pods, declares to the container engine (Docker by default) to spawn or terminate a container until the requested number is running.

## Command lines examples

```bash
# get all replicasets
kubectl get rs

# autoscale the replicaset
kubectl autoscale rs frontend --max=10 --min=3 --cpu-percent=50

# scale a replicaset named 'foo' to 3
kubectl scale --replicas=3 rs/foo
```

## Manifest examples

```yaml
apiVersion: apps/v1
kind: ReplicaSet
metadata:
  name: frontend
  labels:
    app: guestbook
    tier: frontend
spec:
  replicas: 3
  selector:
    matchLabels:
      tier: frontend
  template:
    metadata:
      labels:
        tier: frontend
    spec:
      containers:
      - name: php-redis
        image: gcr.io/google_samples/gb-frontend:v3
```
