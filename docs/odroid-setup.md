# Kubernetes setup on Odroid (boards)

## OS setup

See [Odroid cheat sheet](https://github.com/devpro/everyday-cheatsheets/blob/master/docs/sbd.md#odroid).

## Requirements

### Certificates

Steps can be done in an Ubuntu (WSL on Windows 10).

#### cfssl installation

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

#### Certificate generation

Follow steps described in [Provisioning a CA and Generating TLS Certificates](https://github.com/kelseyhightower/kubernetes-the-hard-way/blob/master/docs/04-certificate-authority.md). Update the commands linked to GCP and use the defined IP addresses.

```bash
cfssl gencert -ca=ca.pem -ca-key=ca-key.pem -config=ca-config.json -hostname=worker-0,192.168.86.142,10.0.0.2 -profile=kubernetes worker-0-csr.json | cfssljson -bar
e worker-0

cfssl gencert -ca=ca.pem -ca-key=ca-key.pem -config=ca-config.json -hostname=10.32.0.1,10.240.0.10,10.240.0.11,10.240.0.12,10.0.0.1,192.168.86.139,127.
0.0.1,kubernetes,kubernetes.default,kubernetes.default.svc,kubernetes.default.svc.cluster,kubernetes.svc.cluster.local -profile=kubernetes kubernetes-csr.json | cfssljson -bare kubernetes

scp ca.pem ca-key.pem kubernetes-key.pem kubernetes.pem service-account-key.pem service-account.pem root@odroid1:~/
scp ca.pem worker-0-key.pem worker-0.pem root@odroid2:~/
```

## Main node

### etcd

See [etcd cheat sheet](https://github.com/devpro/everyday-cheatsheets/edit/master/docs/etcd.md).

On the control plane node.

#### Install from an official version (processor must be 64bit)

```
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
  --cluster-name=kubernetes \\
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
```
