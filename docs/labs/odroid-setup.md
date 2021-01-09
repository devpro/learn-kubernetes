# Kubernetes setup on Odroid

## General configuration

### Kubernetes cluster

Name: kubernetes-odroid-xu4

### Network configuration

Value | Detail
----- | ------
192.168.86.0/24 | Internet connected WLAN
10.0.0.0/24 | Local configuration
10.200.0.0/16 | CIDR Range for Pods in cluster
10.32.0.0/24 | A CIDR notation IP range from which to assign service cluster IPs. This must not overlap with any IP ranges assigned to nodes for pods.

## OS setup

See [Odroid cheat sheet](https://github.com/devpro/everyday-cheatsheets/blob/master/docs/sbd.md#odroid).

## Requirements

### Certificates

Steps can be done in an Ubuntu (WSL on Windows 10).

<details>
  <summary>cfssl installation</summary>
  
  See [release page](https://github.com/cloudflare/cfssl/releases).

  ```bash
  # install locally cfssl
  wget -q --show-progress --https-only --timestamping https://github.com/cloudflare/cfssl/releases/download/v1.4.1/cfssl_1.4.1_linux_amd64
  mv cfssl_1.4.1_linux_amd64 cfssl
  chmod +x cfssl
  sudo mv cfssl /usr/local/bin/
  cfssl version

  # install locally cfssljson
  wget -q --show-progress --https-only --timestamping https://github.com/cloudflare/cfssl/releases/download/v1.4.1/cfssljson_1.4.1_linux_amd64
  mv cfssljson_1.4.1_linux_amd64 cfssljson
  chmod +x cfssljson
  sudo mv cfssljson /usr/local/bin/
  cfssljson --version
  ```
  
</details>

<details>
  <summary>Certificate generation</summary>
  
  Follow steps described in [Provisioning a CA and Generating TLS Certificates](https://github.com/kelseyhightower/kubernetes-the-hard-way/blob/master/docs/04-certificate-authority.md). Update the commands linked to GCP and use the defined IP addresses.

  ```bash
  cfssl gencert -ca=ca.pem -ca-key=ca-key.pem -config=ca-config.json -hostname=worker-0,192.168.86.142,10.0.0.2 -profile=kubernetes worker-0-csr.json | cfssljson -bar
  e worker-0

  cfssl gencert -ca=ca.pem -ca-key=ca-key.pem -config=ca-config.json -hostname=10.32.0.1,10.240.0.10,10.240.0.11,10.240.0.12,10.0.0.1,192.168.86.139,127.
  0.0.1,kubernetes,kubernetes.default,kubernetes.default.svc,kubernetes.default.svc.cluster,kubernetes.svc.cluster.local -profile=kubernetes kubernetes-csr.json | cfssljson -bare kubernetes

  scp ca.pem ca-key.pem kubernetes-key.pem kubernetes.pem service-account-key.pem service-account.pem root@odroid1:~/
  scp ca.pem worker-0-key.pem worker-0.pem root@odroid2:~/
  ```

</details>

## Main node(s)s

### etcd

See [etcd cheat sheet](https://github.com/devpro/everyday-cheatsheets/edit/master/docs/etcd.md).

On the control plane node.

#### Install from an official version (processor must be 64bit)

```bash
wget -q --show-progress --https-only --timestamping "https://github.com/etcd-io/etcd/releases/download/v3.4.10/etcd-v3.4.10-linux-arm64.tar.gz"
tar -xvf etcd-v3.4.10-linux-arm64.tar.gz
rm -f etcd-v3.4.10-linux-arm64.tar.gz
sudo mv etcd-v3.4.10-linux-arm64/etcd /usr/local/bin/
sudo mv etcd-v3.4.10-linux-arm64/etcdctl /usr/local/bin/
rm -rf etcd-v3.4.10-linux-arm64/
etcd --version
etcdctl version
```

#### Install with the package management (not recommended and didn't work on ARM 32bit)

```bash
sudo apt-get install etcd

sudo nano /etc/default/etcd
# add a line at the end: ETCD_UNSUPPORTED_ARCH=arm

sudo apt-get install etcd
sudo apt remove etcd

# there were multiple files left to be delete manually
```

#### Build from source

- Install Go

```bash
# from an official release package
wget -q --show-progress --https-only --timestamping "https://golang.org/dl/go1.14.6.linux-armv6l.tar.gz"
tar -xvf go1.14.6.linux-armv6l.tar.gz
sudo mv go /usr/local/

# or another easier way to install it
sudo apt-get install golang

# make sure the binary is ok
go version
```

- Set GOPATH

```bash
if grep -q GOPATH "$(echo ${HOME})/.bashrc"; then 
  echo "bashrc already has GOPATH";
else
  echo "adding GOPATH to bashrc";
  echo "export GOPATH=$(echo ${HOME})/go" >> ${HOME}/.bashrc;
  PATH_VAR=$PATH":/usr/lib/go/bin:$(echo ${HOME})/go/bin";
  echo "export PATH=$(echo $PATH_VAR)" >> ${HOME}/.bashrc;
  source ${HOME}/.bashrc;
fi

mkdir -p $GOPATH/bin/
```

- Install git

```bash
sudo apt install git
```

- Build sources

```bash
git clone https://github.com/etcd-io/etcd --branch release-3.4 ${GOPATH}/src/go.etcd.io/etcd

cd ${GOPATH}/src/go.etcd.io/etcd && ./build

export ETCD_UNSUPPORTED_ARCH=arm
${GOPATH}/src/go.etcd.io/etcd/bin/etcd --version
${GOPATH}/src/go.etcd.io/etcd/bin/etcdctl version

sudo mv ${GOPATH}/src/go.etcd.io/etcd/bin/etcd /usr/local/bin/
sudo mv ${GOPATH}/src/go.etcd.io/etcd/bin/etcdctl /usr/local/bin/

sudo mkdir -p /etc/etcd /var/lib/etcd
sudo chmod 700 /var/lib/etcd
sudo cp ca.pem kubernetes-key.pem kubernetes.pem /etc/etcd/

#unset ETCD_UNSUPPORTED_ARCH
```

#### Create a service

```bash
cat <<EOF | sudo tee /etc/systemd/system/etcd.service
[Unit]
Description=etcd
Documentation=https://github.com/etcd-io

[Service]
Type=notify
ExecStart=/usr/local/bin/etcd \\
  --name odroid1 \\
  --cert-file=/etc/etcd/kubernetes.pem \\
  --key-file=/etc/etcd/kubernetes-key.pem \\
  --peer-cert-file=/etc/etcd/kubernetes.pem \\
  --peer-key-file=/etc/etcd/kubernetes-key.pem \\
  --trusted-ca-file=/etc/etcd/ca.pem \\
  --peer-trusted-ca-file=/etc/etcd/ca.pem \\
  --peer-client-cert-auth \\
  --client-cert-auth \\
  --initial-advertise-peer-urls https://10.0.0.1:2380 \\
  --listen-peer-urls https://10.0.0.1:2380 \\
  --listen-client-urls https://10.0.0.1:2379,https://127.0.0.1:2379,https://192.168.86.139:2379 \\
  --advertise-client-urls https://10.0.0.1:2379 \\
  --initial-cluster-token etcd-cluster-0 \\
  --initial-cluster odroid1=https://10.0.0.1:2380 \\
  --initial-cluster-state new \\
  --data-dir=/var/lib/etcd
Restart=on-failure
RestartSec=5
Environment=ETCD_UNSUPPORTED_ARCH=arm

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reload
sudo systemctl enable etcd
sudo systemctl start etcd
sudo systemctl status etcd

ETCDCTL_API=3 etcdctl member list \
  --endpoints=https://127.0.0.1:2379 \
  --cacert=/etc/etcd/ca.pem \
  --cert=/etc/etcd/kubernetes.pem \
  --key=/etc/etcd/kubernetes-key.pem
```

#### Remote check

From a remote workstation

```bash
export ETCDCTL_API=3

# should return "OK"
etcdctl --endpoints=https://192.168.86.139:2379 --cacert=./ca.pem --cert=./kubernetes.pem --key=./kubernetes-key.pem put foo "Hello world!"

# should return "foo\nHello world!"
etcdctl --endpoints=https://192.168.86.139:2379 --cacert=./ca.pem --cert=./kubernetes.pem --key=./kubernetes-key.pem get foo

# should return "1"
etcdctl --endpoints=https://192.168.86.139:2379 --cacert=./ca.pem --cert=./kubernetes.pem --key=./kubernetes-key.pem del foo
```

### Kubernetes control plane

#### Local folders

- Create kubeconfig files by following [the procedure](https://github.com/kelseyhightower/kubernetes-the-hard-way/blob/master/docs/05-kubernetes-configuration-files.md)

- Execute the lines

```bash
mkdir -p /etc/kubernetes/config
sudo mkdir -p /var/lib/kubernetes/

ENCRYPTION_KEY=$(head -c 32 /dev/urandom | base64)
cat > encryption-config.yaml <<EOF
kind: EncryptionConfig
apiVersion: v1
resources:
  - resources:
      - secrets
    providers:
      - aescbc:
          keys:
            - name: key1
              secret: ${ENCRYPTION_KEY}
      - identity: {}
EOF
sudo mv ca.pem ca-key.pem kubernetes-key.pem kubernetes.pem \
    service-account-key.pem service-account.pem \
    encryption-config.yaml /var/lib/kubernetes/
    
sudo mv kube-controller-manager.kubeconfig /var/lib/kubernetes/

sudo mv kube-scheduler.kubeconfig /var/lib/kubernetes/
```

#### Install components from release packages

```bash
wget -q --show-progress --https-only --timestamping "https://dl.k8s.io/v1.18.5/kubernetes-server-linux-arm.tar.gz"
tar -xvf kubernetes-server-linux-arm.tar.gz

chmod +x kubernetes/server/bin/kube-apiserver kubernetes/server/bin/kube-controller-manager kubernetes/server/bin/kube-scheduler kubernetes/server/bin/kubectl
sudo mv kubernetes/server/bin/kube-apiserver kubernetes/server/bin/kube-controller-manager kubernetes/server/bin/kube-scheduler kubernetes/server/bin/kubectl /usr/local/bin/
```

#### Create service files

```bash
cat <<EOF | sudo tee /etc/systemd/system/kube-apiserver.service
[Unit]
Description=Kubernetes API Server
Documentation=https://github.com/kubernetes/kubernetes

[Service]
ExecStart=/usr/local/bin/kube-apiserver \\
  --advertise-address=10.0.0.1 \\
  --allow-privileged=true \\
  --apiserver-count=3 \\
  --audit-log-maxage=30 \\
  --audit-log-maxbackup=3 \\
  --audit-log-maxsize=100 \\
  --audit-log-path=/var/log/audit.log \\
  --authorization-mode=Node,RBAC \\
  --bind-address=0.0.0.0 \\
  --client-ca-file=/var/lib/kubernetes/ca.pem \\
  --enable-admission-plugins=NamespaceLifecycle,NodeRestriction,LimitRanger,ServiceAccount,DefaultStorageClass,ResourceQuota \\
  --etcd-cafile=/var/lib/kubernetes/ca.pem \\
  --etcd-certfile=/var/lib/kubernetes/kubernetes.pem \\
  --etcd-keyfile=/var/lib/kubernetes/kubernetes-key.pem \\
  --etcd-servers=https://10.0.0.1:2379 \\
  --event-ttl=1h \\
  --encryption-provider-config=/var/lib/kubernetes/encryption-config.yaml \\
  --kubelet-certificate-authority=/var/lib/kubernetes/ca.pem \\
  --kubelet-client-certificate=/var/lib/kubernetes/kubernetes.pem \\
  --kubelet-client-key=/var/lib/kubernetes/kubernetes-key.pem \\
  --kubelet-https=true \\
  --runtime-config='api/all=true' \\
  --service-account-key-file=/var/lib/kubernetes/service-account.pem \\
  --service-cluster-ip-range=10.32.0.0/24 \\
  --service-node-port-range=30000-32767 \\
  --tls-cert-file=/var/lib/kubernetes/kubernetes.pem \\
  --tls-private-key-file=/var/lib/kubernetes/kubernetes-key.pem \\
  --v=2
Restart=on-failure
RestartSec=5

[Install]
WantedBy=multi-user.target
EOF

cat <<EOF | sudo tee /etc/systemd/system/kube-controller-manager.service
[Unit]
Description=Kubernetes Controller Manager
Documentation=https://github.com/kubernetes/kubernetes

[Service]
ExecStart=/usr/local/bin/kube-controller-manager \\
  --bind-address=0.0.0.0 \\
  --cluster-cidr=10.200.0.0/16 \\
  --cluster-name=kubernetes-odroid-xu4 \\
  --cluster-signing-cert-file=/var/lib/kubernetes/ca.pem \\
  --cluster-signing-key-file=/var/lib/kubernetes/ca-key.pem \\
  --kubeconfig=/var/lib/kubernetes/kube-controller-manager.kubeconfig \\
  --leader-elect=true \\
  --root-ca-file=/var/lib/kubernetes/ca.pem \\
  --service-account-private-key-file=/var/lib/kubernetes/service-account-key.pem \\
  --service-cluster-ip-range=10.32.0.0/24 \\
  --use-service-account-credentials=true \\
  --v=2
Restart=on-failure
RestartSec=5

[Install]
WantedBy=multi-user.target
EOF

cat <<EOF | sudo tee /etc/kubernetes/config/kube-scheduler.yaml
apiVersion: kubescheduler.config.k8s.io/v1alpha1
kind: KubeSchedulerConfiguration
clientConnection:
  kubeconfig: "/var/lib/kubernetes/kube-scheduler.kubeconfig"
leaderElection:
  leaderElect: true
EOF

cat <<EOF | sudo tee /etc/systemd/system/kube-scheduler.service
[Unit]
Description=Kubernetes Scheduler
Documentation=https://github.com/kubernetes/kubernetes

[Service]
ExecStart=/usr/local/bin/kube-scheduler \\
  --config=/etc/kubernetes/config/kube-scheduler.yaml \\
  --v=2
Restart=on-failure
RestartSec=5

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reload
sudo systemctl enable kube-apiserver kube-controller-manager kube-scheduler
sudo systemctl start kube-apiserver kube-controller-manager kube-scheduler
sudo systemctl status kube-apiserver kube-controller-manager kube-scheduler
```

#### Create nginx as proxy

```bash
sudo apt-get update
sudo apt-get install -y nginx

cat > kubernetes.default.svc.cluster.local <<EOF
server {
  listen      80;
  server_name kubernetes.default.svc.cluster.local;

  location /healthz {
     proxy_pass                    https://127.0.0.1:6443/healthz;
     proxy_ssl_trusted_certificate /var/lib/kubernetes/ca.pem;
  }
}
EOF

sudo mv kubernetes.default.svc.cluster.local /etc/nginx/sites-available/kubernetes.default.svc.cluster.local
sudo ln -s /etc/nginx/sites-available/kubernetes.default.svc.cluster.local /etc/nginx/sites-enabled/

# fix issue: [emerg] could not build server_names_hash, you should increase server_names_hash_bucket_size: 32
sudo vi /etc/nginx/nginx.conf
# uncomment server_names_hash_bucket_size 64;

sudo systemctl restart nginx
sudo systemctl enable nginx

# check all components are healthy (scheduler, controller-manager, etcd-0)
kubectl get componentstatuses --kubeconfig admin.kubeconfig

# test nginx health check proxy (should return HTTP 200)
curl -H "Host: kubernetes.default.svc.cluster.local" -i http://127.0.0.1/healthz
```

#### RBAC for Kubelet authorization

```bash
# should create clusterrole.rbac.authorization.k8s.io/system:kube-apiserver-to-kubelet
cat <<EOF | kubectl apply --kubeconfig admin.kubeconfig -f -
apiVersion: rbac.authorization.k8s.io/v1beta1
kind: ClusterRole
metadata:
  annotations:
    rbac.authorization.kubernetes.io/autoupdate: "true"
  labels:
    kubernetes.io/bootstrapping: rbac-defaults
  name: system:kube-apiserver-to-kubelet
rules:
  - apiGroups:
      - ""
    resources:
      - nodes/proxy
      - nodes/stats
      - nodes/log
      - nodes/spec
      - nodes/metrics
    verbs:
      - "*"
EOF

# should create clusterrolebinding.rbac.authorization.k8s.io/system:kube-apiserver
cat <<EOF | kubectl apply --kubeconfig admin.kubeconfig -f -
apiVersion: rbac.authorization.k8s.io/v1beta1
kind: ClusterRoleBinding
metadata:
  name: system:kube-apiserver
  namespace: ""
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: system:kube-apiserver-to-kubelet
subjects:
  - apiGroup: rbac.authorization.k8s.io
    kind: User
    name: kubernetes
EOF
```

#### External access

From the frond end machine (odroid1):

```bash
ufw allow 6443
```

Test from an external machine (Ubuntu used to generate certifiates):

```bash
# should return Kubernetes information
curl --cacert ca.pem https://192.168.86.139:6443/version
```

## Worker node

### OS dependencies

```bash
sudo apt-get update
sudo apt-get -y install socat conntrack ipset

# make sure Swap is off (result should be empty)
sudo swapon --show
```

### Install worker binaries

```bash
# create local directories
sudo mkdir -p \
  /etc/cni/net.d \
  /opt/cni/bin \
  /var/lib/kubelet \
  /var/lib/kube-proxy \
  /var/lib/kubernetes \
  /var/run/kubernetes

# download kubernetes worker binaries and client binary
wget -q --show-progress --https-only --timestamping \
  https://storage.googleapis.com/kubernetes-release/release/v1.18.5/bin/linux/arm/kubectl \
  https://storage.googleapis.com/kubernetes-release/release/v1.18.5/bin/linux/arm/kube-proxy \
  https://storage.googleapis.com/kubernetes-release/release/v1.18.5/bin/linux/arm/kubelet
chmod +x kubectl kube-proxy kubelet
sudo mv kubectl kube-proxy kubelet /usr/local/bin/

# download crictl & cni plugins
wget -q --show-progress --https-only --timestamping \
  https://github.com/kubernetes-sigs/cri-tools/releases/download/v1.18.0/crictl-v1.18.0-linux-arm.tar.gz
tar -xvf crictl-v1.18.0-linux-arm.tar.gz
sudo mv crictl /usr/local/bin/
rm crictl-v1.18.0-linux-arm.tar.gz
crictl --version

# download cni plugins
wget -q --show-progress --https-only --timestamping \
  https://github.com/containernetworking/plugins/releases/download/v0.8.6/cni-plugins-linux-arm-v0.8.6.tgz
sudo tar -xvf cni-plugins-linux-arm-v0.8.6.tgz -C /opt/cni/bin/
rm cni-plugins-linux-arm-v0.8.6.tgz

# install Go (needed to build certain tool in ARM 32bit)
wget -q --show-progress --https-only --timestamping https://golang.org/dl/go1.14.6.linux-armv6l.tar.gz
tar -C /usr/local -xzf go1.14.6.linux-armv6l.tar.gz
cat << \EOF >> ~/.profile

# add Go
export PATH=$PATH:/usr/local/go/bin
EOF
source $HOME/.profile
go version

# build runc
apt install git
apt install libseccomp-dev
apt install pkg-config
mkdir -p github.com/opencontainers
cd github.com/opencontainers
git clone https://github.com/opencontainers/runc
cd runc
git checkout tags/v1.0.0-rc91
make
sudo mv runc /usr/local/bin/
runc --version

# grab containerd from docker release (see https://download.docker.com/linux/static/stable/)
wget -q --show-progress --https-only --timestamping https://download.docker.com/linux/static/stable/armhf/docker-19.03.12.tgz
tar -xvf docker-19.03.12.tgz
chown root:root docker/containerd*
sudo mv docker/containerd* /bin/
rm -r docker
rm docker-19.03.12.tgz
```

## Create configuration files

From the single machine that generated the certificates:

```bash
kubectl config set-cluster kubernetes-odroid-xu4 \
  --certificate-authority=ca.pem \
  --embed-certs=true \
  --server=https://192.168.86.139:6443 \
  --kubeconfig=worker-0.kubeconfig
kubectl config set-credentials system:node:worker-0 \
  --client-certificate=worker-0.pem \
  --client-key=worker-0-key.pem \
  --embed-certs=true \
  --kubeconfig=worker-0.kubeconfig
kubectl config set-context default \
  --cluster=kubernetes-odroid-xu4 \
  --user=system:node:worker-0 \
  --kubeconfig=worker-0.kubeconfig
kubectl config use-context default --kubeconfig=worker-0.kubeconfig
scp worker-0.kubeconfig root@odroid2:~/

kubectl config set-cluster kubernetes-odroid-xu4 \
  --certificate-authority=ca.pem \
  --embed-certs=true \
  --server=https://192.168.86.139:6443 \
  --kubeconfig=kube-proxy.kubeconfig
kubectl config set-credentials system:kube-proxy \
  --client-certificate=kube-proxy.pem \
  --client-key=kube-proxy-key.pem \
  --embed-certs=true \
  --kubeconfig=kube-proxy.kubeconfig
kubectl config set-context default \
  --cluster=kubernetes-odroid-xu4 \
  --user=system:kube-proxy \
  --kubeconfig=kube-proxy.kubeconfig
kubectl config use-context default --kubeconfig=kube-proxy.kubeconfig
scp kube-proxy.kubeconfig root@odroid2:~/
```

## Configure networks

```bash
cat <<EOF | sudo tee /etc/cni/net.d/10-bridge.conf
{
    "cniVersion": "0.3.1",
    "name": "bridge",
    "type": "bridge",
    "bridge": "cnio0",
    "isGateway": true,
    "ipMasq": true,
    "ipam": {
        "type": "host-local",
        "ranges": [
          [{"subnet": "10.200.0.0/16"}]
        ],
        "routes": [{"dst": "0.0.0.0/0"}]
    }
}
EOF

cat <<EOF | sudo tee /etc/cni/net.d/99-loopback.conf
{
    "cniVersion": "0.3.1",
    "name": "lo",
    "type": "loopback"
}
EOF
```

## Configure containerd

```bash
sudo mkdir -p /etc/containerd/
cat << EOF | sudo tee /etc/containerd/config.toml
[plugins]
  [plugins.cri.containerd]
    snapshotter = "overlayfs"
    [plugins.cri.containerd.default_runtime]
      runtime_type = "io.containerd.runtime.v1.linux"
      runtime_engine = "/usr/local/bin/runc"
      runtime_root = ""
EOF

cat <<EOF | sudo tee /etc/systemd/system/containerd.service
[Unit]
Description=containerd container runtime
Documentation=https://containerd.io
After=network.target

[Service]
ExecStartPre=/sbin/modprobe overlay
ExecStart=/bin/containerd
Restart=always
RestartSec=5
Delegate=yes
KillMode=process
OOMScoreAdjust=-999
LimitNOFILE=1048576
LimitNPROC=infinity
LimitCORE=infinity

[Install]
WantedBy=multi-user.target
EOF
```

## Configure kubelet

```bash
sudo mv worker-0-key.pem worker-0.pem /var/lib/kubelet/
sudo mv worker-0.kubeconfig /var/lib/kubelet/kubeconfig
sudo mv ca.pem /var/lib/kubernetes/

cat <<EOF | sudo tee /var/lib/kubelet/kubelet-config.yaml
kind: KubeletConfiguration
apiVersion: kubelet.config.k8s.io/v1beta1
authentication:
  anonymous:
    enabled: false
  webhook:
    enabled: true
  x509:
    clientCAFile: "/var/lib/kubernetes/ca.pem"
authorization:
  mode: Webhook
clusterDomain: "cluster.local"
clusterDNS:
  - "10.32.0.10"
podCIDR: "10.200.0.0/16"
resolvConf: "/run/systemd/resolve/resolv.conf"
runtimeRequestTimeout: "15m"
tlsCertFile: "/var/lib/kubelet/worker-0.pem"
tlsPrivateKeyFile: "/var/lib/kubelet/worker-0-key.pem"
EOF

cat <<EOF | sudo tee /etc/systemd/system/kubelet.service
[Unit]
Description=Kubernetes Kubelet
Documentation=https://github.com/kubernetes/kubernetes
After=containerd.service
Requires=containerd.service

[Service]
ExecStart=/usr/local/bin/kubelet \\
  --config=/var/lib/kubelet/kubelet-config.yaml \\
  --container-runtime=remote \\
  --container-runtime-endpoint=unix:///var/run/containerd/containerd.sock \\
  --image-pull-progress-deadline=2m \\
  --kubeconfig=/var/lib/kubelet/kubeconfig \\
  --network-plugin=cni \\
  --register-node=true \\
  --hostname-override=worker-0 \\
  --v=2
Restart=on-failure
RestartSec=5

[Install]
WantedBy=multi-user.target
EOF
```

## Configure kube-proxy

```bash
sudo mv kube-proxy.kubeconfig /var/lib/kube-proxy/kubeconfig

cat <<EOF | sudo tee /var/lib/kube-proxy/kube-proxy-config.yaml
kind: KubeProxyConfiguration
apiVersion: kubeproxy.config.k8s.io/v1alpha1
clientConnection:
  kubeconfig: "/var/lib/kube-proxy/kubeconfig"
mode: "iptables"
clusterCIDR: "10.200.0.0/16"
EOF

cat <<EOF | sudo tee /etc/systemd/system/kube-proxy.service
[Unit]
Description=Kubernetes Kube Proxy
Documentation=https://github.com/kubernetes/kubernetes

[Service]
ExecStart=/usr/local/bin/kube-proxy \\
  --config=/var/lib/kube-proxy/kube-proxy-config.yaml \\
  --hostname-override=worker-0
Restart=on-failure
RestartSec=5

[Install]
WantedBy=multi-user.target
EOF
```

### Start worker services

If there are some issues, execute directly the command line seen in the service file.

```bash
sudo systemctl daemon-reload
sudo systemctl enable containerd kubelet kube-proxy
sudo systemctl start containerd kubelet kube-proxy
sudo systemctl status containerd kubelet kube-proxy
```

From the main node, check you can see the node:

```bash
kubectl get nodes --kubeconfig admin.kubeconfig
```

## Remote access

From the workstation used to generate certificates:

```bash
kubectl config set-cluster kubernetes-odroid-xu4 \
  --certificate-authority=ca.pem \
  --embed-certs=true \
  --server=https://192.168.86.139:6443

kubectl config set-credentials admin \
  --client-certificate=admin.pem \
  --client-key=admin-key.pem

kubectl config set-context kubernetes-odroid-xu4 \
  --cluster=kubernetes-odroid-xu4 \
  --user=admin

kubectl config use-context kubernetes-odroid-xu4

kubectl get componentstatuses
kubectl get nodes
```

## Network routes

Goal: enable networking between pods

[Cluster Networking](https://kubernetes.io/docs/concepts/cluster-administration/networking/)

## Cluster DNS

[DNS for Services and Pods](https://kubernetes.io/docs/concepts/services-networking/dns-pod-service/)

From the machine where we generated the certificates:

```bash
# install Helm
wget https://get.helm.sh/helm-v3.2.4-linux-amd64.tar.gz
tar -zxvf helm-v3.2.4-linux-amd64.tar.gz
mv linux-amd64/helm /usr/local/bin/
rm helm-v3.2.4-linux-amd64.tar.gz
rm -r linux-amd64/
helm version

# generate and apply CoreDNS definition (will generate a configmap, clusterrole.rbac.authorization.k8s.io, clusterrolebinding.rbac.authorization.k8s.io; service/coredns-coredns, deployment.apps/coredns-coredns)
helm template coredns stable/coredns --namespace=kube-system > coredns.yml
kubectl apply -f coredns.yaml -n kube-system
kubectl get pods -n kube-system
```

## Quick check

```bash
# create a pod
kubectl run busybox --image=busybox:1.28 --command -- sleep 3600

# make sure the pod is created
kubectl get pods -l run=busybox

# look for kubernetes service
POD_NAME=$(kubectl get pods -l run=busybox -o jsonpath="{.items[0].metadata.name}")
kubectl exec -ti $POD_NAME -- nslookup kubernetes
```

## Smoke tests

```bash
# create a first deployment
kubectl create deployment nginx --image=nginx
kubectl get pods -l app=nginx

# port forwarding
POD_NAME=$(kubectl get pods -l app=nginx -o jsonpath="{.items[0].metadata.name}")
kubectl port-forward $POD_NAME 8080:80

# from another terminal (then stop port forwarding in the initial command)
curl --head http://127.0.0.1:8080

# interact with the pod
kubectl logs $POD_NAME
kubectl exec -ti $POD_NAME -- nginx -v
```
