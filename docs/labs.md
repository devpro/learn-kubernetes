# Lab exercises

## Kubernetes objects

### Deployments

```bash
# create a simple Deployment
kubectl create deployment firstpod --image=nginx

# review objects
kubectl get deployment,pod

# view object details
kubectl describe deployment firstpod
kubectl describe pod firstpod-xxxx

# delete the Deployment
kubectl delete deployment firstpod
```
