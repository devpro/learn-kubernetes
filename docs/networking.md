# Networking in Kubernetes

## Linux basics

```bash
ip link

ip link add v-net-0 type bridge

ip link set dev v-net-0 up

ip link add veth-red type veth peer name veth-red-br

ip link set veth-red netns red

ip -n red addr add 192.168.15.1 dev veth-red

ip -n red link set veth-red up

ip netns exec blue ip route add 192.168.1.0/24 via 192.168.15.5

ip addr

ip addr add 192.168.1.10/24 dev eth0

ip route

ip route add 192.168.1.0/24 via 192.168.2.1

cat /proc/sys/net/ipv4/ip_forward

arp

netstat -plnt

route

iptables -t nat -A POSTROUTING -s 192.168.15.0/24 -j MASQUERADE
```

## Recipes

- Get the network interface configured for cluster connectivity on the master node

```bash
ip link
```

- Get the IP address assigned to the master node on this interface

```bash
kubectl get nodes -o wide
```

- Get the route used to ping google from the master node (what is the IP address of the Default Gateway?)

```bash
ip route show default
```

- Get the port the kube-scheduler is listening on in the master node

```bash
netstat -nplt
```

- Get CNI configuration

```bash
ps -aux | grep kubelet
```

- Get the CNI plugin configured to be used on this kubernetes cluster

```bash
ls /etc/cni/net.d/
```

- What is the POD IP address range configured by weave?

```bash
ip addr show weave
```

- What is the default gateway configured on the PODs scheduled on node03? (Try scheduling a pod on node03 and check ip route output)

```bash
# create pod with nodeName set and wait for it to be in running state, get its ip

# look at the route and the gateway
ip route get 10.32.0.3

# or ssh in the pod and execute
ip route
```

- What network range are the nodes in the cluster part of?

```bash
# look at ens3 interface
ip addr
```

- What is the range of IP addresses configured for PODs on this cluster?

```bash
# look at starting log message with ipalloc-rande
kubectl logs <weave-pod-name> weave -n kube-system
```

- What is the IP Range configured for the services within the cluster?

```bash
# look at kube api server configuration
cat /etc/kubernetes/manifests/kube-apiserver.yaml | grep cluster-ip-range
```

- What type of proxy is the kube-proxy configured to use?

```bash
k logs kube-proxy-lx9pq -n kube-system
```
