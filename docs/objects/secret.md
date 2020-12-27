# Kubernetes Secret object

[Kubernetes Documentation/Concepts/Configuration/Secrets](https://kubernetes.io/docs/concepts/configuration/secret/)

A **Secret** is an object that contains a small amount of sensitive data such as a password, a token, or a key.

## Usecases

- Using Secrets as environment variables

  - Pod definition

  ```yaml
  apiVersion: v1
  kind: Pod
  metadata:
    name: secret-env-pod
  spec:
    containers:
      - name: redis
        image: redis
        ports:
          - containerPort: 80
            protocol: TCP
        env:
          - name: FIRST_PARAM
            valueFrom:
              secretKeyRef:
                name: <secret-name>
                key: key1
          - name: SECOND_PARAM
            valueFrom:
              secretKeyRef:
                name: <secret-name>
                key: key2
  ```

## Command line examples

```bash
kubectl create secret generic <secret-name> --from-literal=key1=value1 --from-literal=key2=value2
```
