# Setup

## Docker

```bash
# adds Docker's official GPG key:
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# sets up the stable repository
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" \
  | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update

# installs Docker engine
sudo apt install -y docker-ce docker-ce-cli containerd.io

# adds the user to docker group so sudo won't be required
sudo usermod -aG docker ${USER}

# enables docker auto start by editing the user profile and exits
echo "sudo service docker start" >> ~/.profile
exit

# downloads latest version of docker compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# applies executable permissions
sudo chmod +x /usr/local/bin/docker-compose
```

→ [docs.docker.com](https://docs.docker.com/engine/install/ubuntu/)

## kubectl

```bash
# downloads the Google Cloud public signing key
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg

# adds the Kubernetes apt repository
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" \
  | sudo tee /etc/apt/sources.list.d/kubernetes.list

# updates apt package index with the new repository and installs kubectl
sudo apt-get update
sudo apt-get install -y kubectl
```

→ [kubernetes.io/docs](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/)

## kind

```bash
# downloads latest version of kind (check before the latest version number on https://github.com/kubernetes-sigs/kind/releases)
sudo curl -L "https://kind.sigs.k8s.io/dl/v0.12.0/kind-linux-amd64" -o /usr/local/bin/kind

# applies executable permissions
sudo chmod +x /usr/local/bin/kind

# checks kind is running ok
kind version

# creates cluster configuration file
cat > kind-cluster-config.yml <<EOM
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
- role: control-plane
  extraPortMappings:
  - containerPort: 30000
    hostPort: 30000
    protocol: TCP
EOM

# creates a cluster
kind create cluster --config manifests/kind-cluster-config.yml

# lists clusters
kind get clusters

# sets kubectl context
kubectl cluster-info --context kind-kind

# cleans-up
kind delete cluster
```

→ [kind.sigs.k8s.io/docs](https://kind.sigs.k8s.io/docs/user/quick-start#installing-from-release-binaries)

## k3d

```bash
# runs installation script
wget -q -O - https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash

# creates a cluster
k3d cluster create firstcluster

# deletes a cluster
k3d cluster delete firstcluster
```

→ [k3d.io](https://k3d.io/#installation)
