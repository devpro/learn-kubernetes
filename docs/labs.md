# Lab exercises

## Kubernetes objects

### Deployments

```bash
# create a simple deployment (see https://kubernetes.io/docs/concepts/workloads/controllers/deployment/)
kubectl create deployment <deployment-name> --image=nginx

# review objects that have been created
kubectl get deploy,pod

# view object details
kubectl describe deployment <deployment-name>
kubectl describe pod <pod-name>

# view or output the deployment YAML definition
kubectl get deployment <deployment-name> -o yaml

# update the container port (see https://kubernetes.io/docs/tasks/manage-kubernetes-objects/update-api-object-kubectl-patch/)
cat > deployment.yaml <<EOL
spec:
  template:
    spec:
      containers:
        - name: <name>
          ports:
            - containerPort: 80
EOL
kubectl patch deployment <deployment-name> --patch "$(cat deployment.yaml)"

# access the webapp through a NodePort service, open http://<ip>:<node_port> (or how to get the url on Minikube)
kubectl expose deployment <deployment-name> --type=NodePort --name=aspnetcoresample
kubectl describe service <service-name>
minikube service <service-name> --url
kubectl delete service <service-name>

# access the webapp through a NodePort service (and how to get the url on Minikube)
kubectl expose deployment <deployment-name> --type=LoadBalancer --port 80 --target-port 80 --name <service-name>
minikube service <service-name>
kubectl delete service <service-name>

# execute bash commands in the pod
kubectl exec --stdin --tty <pod-name> -- bash

# delete the Deployment
kubectl delete deployment <deployment-name>
```
