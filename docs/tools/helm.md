# Helm

> The package manager for Kubernetes.
> It is the best way to find, share, and use software built for Kubernetes

🌐 [helm.sh](https://helm.sh/), [code](https://github.com/helm/helm), [docs](https://helm.sh/docs/)

## Quick start

🌐 [quickstart guide](https://helm.sh/docs/intro/quickstart/)

### Installation

🌐 [Installing Helm](https://helm.sh/docs/intro/install/)

On Linux, install [from script](https://helm.sh/docs/intro/install/#from-script).

On Windows, go to the [releases](https://github.com/helm/helm/releases) page, download the zip file, extract and move the exe file to a folder defined in the PATH environment variable.

Make sure helm is available:

```bash
helm version
```

### Helm repositories

Helm charts are found and searched thanks to repositories that must be added manually (with `helm repo add xxx https://yyy`):

```bash
# lists all repositories that have been added
helm repo ls

# updates repository information
helm repo update

# searches in a repository
helm search repo xxx
```

## Charts

### Chart structure

```txt
mychart
├── Chart.yaml
├── templates
│ ├── deployment.yaml
│ └── service.yaml
└── values.yaml
```

## CLI reference

Command                       | Action
------------------------------|----------------------------------------------------------------------------------
`helm help <action>`          | Get help message on xxx command (install for example)
`helm list`                   | List applications released with Helm
`helm repo <command>`         | List Helm repositories
`helm show chart stable/xxxx` | Get a simple idea of the features of chart stable/xxxx (stable/mysql for example)
`helm uninstall <name>`       | Uninstall a release
