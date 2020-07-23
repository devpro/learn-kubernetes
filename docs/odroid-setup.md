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

#### Certification generation

Follow steps described in [Provisioning a CA and Generating TLS Certificates](https://github.com/kelseyhightower/kubernetes-the-hard-way/blob/master/docs/04-certificate-authority.md). Update the commands linked to GCP and use the defined IP addresses.

```bash
cfssl gencert -ca=ca.pem -ca-key=ca-key.pem -config=ca-config.json -hostname=worker-0,192.168.86.142,10.0.0.2 -profile=kubernetes worker-0-csr.json | cfssljson -bar
e worker-0

cfssl gencert -ca=ca.pem -ca-key=ca-key.pem -config=ca-config.json -hostname=10.32.0.1,10.240.0.10,10.240.0.11,10.240.0.12,10.0.0.1,192.168.86.139,127.
0.0.1,kubernetes,kubernetes.default,kubernetes.default.svc,kubernetes.default.svc.cluster,kubernetes.svc.cluster.local -profile=kubernetes kubernetes-csr.json | cfssljson -bare kubernetes

scp ca.pem ca-key.pem kubernetes-key.pem kubernetes.pem service-account-key.pem service-account.pem root@odroid1:~/
scp ca.pem worker-0-key.pem worker-0.pem root@odroid2:~/
```

## Control plane

### etcd

See [etcd cheat sheet](https://github.com/devpro/everyday-cheatsheets/edit/master/docs/etcd.md).

On the control plane node.

Install from an official version (must be in 64bit).

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

Build from source:

```
# from the official
wget -q --show-progress --https-only --timestamping "https://golang.org/dl/go1.14.6.linux-armv6l.tar.gz"
tar -xvf go1.14.6.linux-armv6l.tar.gz
sudo mv go /usr/local/

if grep -q GOPATH "$(echo ${HOME})/.bashrc"; then 
  echo "bashrc already has GOPATH";
else
  echo "adding GOPATH to bashrc";
  echo "export GOPATH=$(echo ${HOME})/go" >> ${HOME}/.bashrc;
  PATH_VAR=$PATH":/usr/local/go/bin:$(echo ${HOME})/go/bin";
  echo "export PATH=$(echo $PATH_VAR)" >> ${HOME}/.bashrc;
  source ${HOME}/.bashrc;
fi

mkdir -p $GOPATH/bin/

# or another easier way to install it
sudo apt-get install golang

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

go version

sudo apt install git

git clone https://github.com/etcd-io/etcd --branch release-3.4 ${GOPATH}/src/go.etcd.io/etcd

cd ${GOPATH}/src/go.etcd.io/etcd && ./build

export ETCD_UNSUPPORTED_ARCH=arm
${GOPATH}/src/go.etcd.io/etcd/bin/etcd --version
${GOPATH}/src/go.etcd.io/etcd/bin/etcdctl version

unset ETCD_UNSUPPORTED_ARCH
  
# or an easier way to install it
sudo apt-get install etcd

sudo nano /etc/default/etcd
# add a line at the end: ETCD_UNSUPPORTED_ARCH=arm
sudo apt-get install etcd
sudo apt remove etcd
```
