# Kubernetes ConfigMap object

> A **ConfigMap** is an API object used to store non-confidential data in key-value pairs. Pods can consume ConfigMaps as environment variables, command-line arguments, or as configuration files in a volume. It allows you to decouple environment-specific configuration from your container images, so that your applications are easily portable.

Reference: [Kubernetes Documentation/Concepts/Configuration/ConfigMaps](https://kubernetes.io/docs/concepts/configuration/configmap/)

## Command line examples

```bash
# get all configmaps in current namespace
k get cm

# create a configmap
k create cm webapp-config-map --from-literal=APP_COLOR=darkblue
```

## Manifest examples

- Example of a ConfigMap that has some keys with single values, and other keys where the value looks like a fragment of a configuration format:

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: game-demo
data:
  # property-like keys; each key maps to a simple value
  player_initial_lives: "3"
  ui_properties_file_name: "user-interface.properties"

  # file-like keys
  game.properties: |
    enemy.types=aliens,monsters
    player.maximum-lives=5
  user-interface.properties: |
    color.good=purple
    color.bad=yellow
    allow.textmode=true
```

## Usecases

### Configure Pods and Containers

- [Configure a Pod to Use a ConfigMap](https://kubernetes.io/docs/tasks/configure-pod-container/configure-pod-configmap/)

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: dapi-test-pod
spec:
  containers:
    - name: test-container
      image: k8s.gcr.io/busybox
      command: [ "/bin/sh", "-c", "env" ]
      env:
        - name: SPECIAL_LEVEL_KEY
          valueFrom:
            configMapKeyRef:
              name: special-config
              key: special.how
  restartPolicy: Never
```

## Going further

- [ConfigMaps in Kubernetes: how they work and what you should remember](https://medium.com/flant-com/configmaps-in-kubernetes-f9f6d0081dcb) - Jun 23 '20
