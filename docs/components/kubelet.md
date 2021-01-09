# kubelet

Default port: 10250

## Recipes

- Look at the configuration

```bash
# look at running processes
ps -aux | grep kubelet

# for example:
# root      2698  3.0  4.7 1930668 97628 ?       Ssl  09:24   0:12 /usr/bin/kubelet --bootstrap-kubeconfig=/etc/kubernetes/bootstrap-kubelet.conf --kubeconfig=/etc/kubernetes/kubelet.conf --config=/var/lib/kubelet/config.yaml --network-plugin=cni --pod-infra-container-image=k8s.gcr.io/pause:3.2

# open the configuration file
more /var/lib/kubelet/config.yaml

# for example
# staticPodPath: /etc/kubernetes/manifests

# list all manifests
ls /etc/kubernetes/manifests
```
