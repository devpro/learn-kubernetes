# etcdctl

**etcdctl** is a command line client for etcd, the database for Kubernetes control plane components.

## Command line examples

```bash
# make sure to use v3
export ETCDCTL_API=3

# display version
etcdctl version

# backup data
etcdctl snapshot save -h

# restore data
etcdctl snapshot restore -h
```

## Usecases

### Backup and restore

- [Backing up an etcd cluster](https://kubernetes.io/docs/tasks/administer-cluster/configure-upgrade-etcd/#backing-up-an-etcd-cluster)
- [etcd/Documentation/op-guide/recovery.md](https://github.com/etcd-io/etcd/blob/master/Documentation/op-guide/recovery.md)
- [Disaster Recovery for your Kubernetes Clusters [I] - Andy Goldstein & Steve Kriss, Heptio](https://www.youtube.com/watch?v=qRPNuT080Hk) - Dec 15, 2017
