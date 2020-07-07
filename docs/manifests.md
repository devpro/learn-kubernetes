# Kubernetes manifests

A manifest is specification of a Kubernetes API object in JSON or YAML format (see [Glossary](https://kubernetes.io/docs/reference/glossary/?all=true#term-manifest)).

Read more:

- [Documentation > Concepts > Cluster Administration > Managing Resources](https://kubernetes.io/docs/concepts/cluster-administration/manage-deployment/)

## Resources

<details>
  <summary>Deployment</summary>

  - `maxSurge` sets the maximum number of excess Pods
  - `maxUnavailable` sets the maximum number of unavailable Pods

  ```
  apiVersion: extensions/v1beta1
  kind: Deployment
  spec:
    replicas: 10
    strategy:
      type: RollingUpdate
      rollingUpdate:
        maxSurge: 20%
        maxUnavailable: 3
  ```
</details>
