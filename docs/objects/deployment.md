# Kubernetes Deployment object

[Kubernetes Documentation/Concepts/Workloads/Workload Resources/Deployments](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/)

**Deployment** is the default controller for containers. It ensures that resources declared in the `PodSpec` are available, such as IP address and storage, and then deploys a `ReplicaSet`.

## Usecases

### Networking

- [Use a Service to Access an Application in a Cluster](https://kubernetes.io/docs/tasks/access-application-cluster/service-access-application-cluster/)

  - Create a new deployment

  ```yaml
  apiVersion: apps/v1
  kind: Deployment
  metadata:
    name: hello-world
  spec:
    selector:
      matchLabels:
        run: load-balancer-example
    replicas: 2
    template:
      metadata:
        labels:
          run: load-balancer-example
      spec:
        containers:
          - name: hello-world
            image: gcr.io/google-samples/node-hello:1.0
            ports:
              - containerPort: 8080
                protocol: TCP
  ```

  - Expose the deployment and check everything is ok

  ```bash
  # access the webapp through a NodePort service
  kubectl expose deployment hello-world --type=NodePort --name=example-service

  # get NodePort IP
  kubectl describe svc example-service

  # check you have a valid answer
  curl <node_ip>:<node_port>
  ```

## Command line examples

```yaml
# list all deployments
kubectl get deploy

# create a new deployment
kubectl create deployment w3 --image=nginx:1.16

# display deployment creation yaml
kubectl create deployment w3 --image=nginx:1.16 --dry-run=client -o yaml

# update an existing deployment to add container port
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

# access the webapp through a NodePort service (ClusterIP by default)
kubectl expose deployment <deployment-name> --name=<service-name>

# access the webapp through a LoadBalancer service (and how to get the url on Minikube)
kubectl expose deployment <deployment-name> --type=LoadBalancer --port 80 --target-port 80 --name <service-name>

# edit deployment
kubectl edit deployment/w3

# update image ("--record" will add the command in CHANGE-CAUSE field, to ease history review)
kubectl set image deployment/w3 nginx=nginx:1.15 --record

# if the deployment named mysql's current size is 2, scale mysql to 3
kubectl scale --current-replicas=2 --replicas=3 deployment/mysql

# get deployment rollout status
kubectl rollout status deployment/w3

# list deployment rollout history
kubectl rollout history deployment/w3

# get a specific deployment history entry
kubectl rollout history deployment/w3 --revision=2

# rollback to a previous version
kubectl rollout undo deployment/w3

# delete the deployment
kubectl delete deployment <deployment-name>
```

## Manifest examples

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
  labels:
    app: nginx
spec:
  replicas: 3
  selector:
    matchLabels:
      app: nginx
  strategy:
    type: RollingUpdate
    rollingUpdate:
      # sets the maximum number of excess Pods
      maxSurge: 20%
      # sets the maximum number of unavailable Pods
      maxUnavailable: 3
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:1.14.2
        ports:
        - containerPort: 80
```
