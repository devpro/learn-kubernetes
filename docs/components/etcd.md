# ETCD instance

Default port: 2379

## Command line examples

```bash
# create backup (look at the options, for example to etcd pod if it's running as a pod, or at the running process with ps command)
ETCDCTL_API=3 etcdctl --endpoints https://127.0.0.1:2379 --cacert="/etc/kubernetes/pki/etcd/ca.crt" --cert="/etc/kubernetes/pki/etcd/server.crt" --key="/etc/kubernetes/pki/etcd/server.key" snapshot save /opt/snapshot-pre-boot.db

# restore backup in a folder
ETCDCTL_API=3 etcdctl snapshot restore /opt/snapshot-pre-boot.db --data-dir="/var/lib/etcd-after-restore"

# update static pod hostpath value in volumes section (if relevant) to use the new data directory
vi /etc/kubernetes/manifests/etcd.yaml

# wait for everything to come up...
```

References:

- [Kubernetes Documentation/Tasks/Administer a Cluster/Operating etcd clusters for Kubernetes](https://kubernetes.io/docs/tasks/administer-cluster/configure-upgrade-etcd/)
- [mmumshad/kubernetes-the-hard-way/practice-questions-answers/cluster-maintenance/backup-etcd/etcd-backup-and-restore.md](https://github.com/mmumshad/kubernetes-the-hard-way/blob/master/practice-questions-answers/cluster-maintenance/backup-etcd/etcd-backup-and-restore.md)
