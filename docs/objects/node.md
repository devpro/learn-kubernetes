# Kubernetes Node object

[Kubernetes Documentation/Concepts/Cluster Architecture/Nodes](https://kubernetes.io/docs/concepts/architecture/nodes/)

## Usecases

* [Kubernetes Documentation/Tasks/Administer a Cluster/Safely Drain a Node](https://kubernetes.io/docs/tasks/administer-cluster/safely-drain-node/)

## Command line examples

```bash
# get node status
kubectl describe node <node_name>

# safely evict all of pods of a node from a node before performing a maintenance on the node (e.g. kernel upgrade, hardware maintenance, etc.)
# safe evictions allow the pod's containers to gracefully terminate and will respect the PodDisruptionBudgets you have specified
kubectl drain <node_name>

# mark a Node unschedulable (prevents the scheduler from placing new pods onto the Node, but does not affect existing Pods on the Node)
# this is useful as a preparatory step before a node reboot or other maintenance
kubectl cordon <node_name>

# resume scheduling new pods onto the node
kubectl uncordon <node_name>

# create a taint on node01 with key of 'spray', value of 'mortein' and effect of 'NoSchedule'
kubectl taint nodes node01 spray=mortein:NoSchedule

# remove the taint on master/controlplane, which currently has the taint effect of NoSchedule
kubectl taint nodes master/controlplane node-role.kubernetes.io/master:NoSchedule-
```
