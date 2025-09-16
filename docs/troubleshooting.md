# Troubleshooting

[kubernetes.io/docs/tasks/debug](https://kubernetes.io/docs/tasks/debug/)

## Debug pod

[Troubleshooting Applications](https://kubernetes.io/docs/tasks/debug/debug-application/)

```bash
kubectl get pods [-o yaml]
kubectl describe pod xxx
kubectl get events [–field-selector type=Warning]
kubectl logs [--previous] xxx
kubectl exec [-it] xxx -- yyy
kubectl debug -it xxx --image=busybox:1.28 --target=yyy
```

## Debug node

[Troubleshooting Clusters](https://kubernetes.io/docs/tasks/debug/debug-cluster/)

```bash
kubectl cluster-info
kubectl get nodes -o wide

# if a node is not Ready
kubectl describe node <node-name>
ssh <node-name>
top
df -h
service kubelet status
journalctl -u kubelet
more /etc/systemd/system/kubelet.service.d/10-kubeadm.conf
service kubelet start

#######TODO
k get deploy -n admin2406 -o=custom-columns=DEPLOYMENT:.metadata.name,CONTAINER_IMAGE:.spec.template.spec.containers[0].image,READY_REPLICAS:.spec.replicas,NAMESPACE:.metadata.namespace --sort-by=.metadata.name > /opt/admin2406_data
k run messaging --image=redis:alpine -l='tier=msg'
k get nodes -o=jsonpath="{.items[*]['status']['nodeInfo']['osImage']}" > /opt/outputs/nodes_os_x43kj56.txt
systemctl show <service>
```
