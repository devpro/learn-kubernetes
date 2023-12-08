# Kubernetes cluster hardening

## Kubernetes API access

> Restrict access to Kubernetes API

✨ [API Access Control](https://kubernetes.io/docs/reference/access-authn-authz/),
[Controlling Access to the Kubernetes API](https://kubernetes.io/docs/concepts/security/controlling-access/),
[How to issue a certificate for a user](https://kubernetes.io/docs/reference/access-authn-authz/certificate-signing-requests/#normal-user),
[Generate Certificates Manually](https://kubernetes.io/docs/tasks/administer-cluster/certificates/),
[kube-apiserver](https://kubernetes.io/docs/reference/command-line-tools-reference/kube-apiserver/)

⚗️ [Practice](practice/2.1-kubernetes-api-access.md)

Additional:

* [Hardening your GKE cluster's security](https://cloud.google.com/anthos/clusters/docs/on-prem/latest/how-to/hardening-your-cluster)
* [Kubernetes RBAC and TLS certificates – Kubernetes security guide](https://sysdig.com/blog/kubernetes-security-rbac-tls/)
* [Securing Your Kubernetes API Server](https://tufin.medium.com/protecting-your-kubernetes-api-server-5eefeea4cf8a)

## RBAC

> Use Role Based Access Controls to minimize exposure

✨ [Using RBAC Authorization](https://kubernetes.io/docs/reference/access-authn-authz/rbac/),
[Authorization Overview](https://kubernetes.io/docs/reference/access-authn-authz/authorization/)

⚗️ [Practice](practice/2.2-rbac.md)

Additional:

* [RBAC.dev](https://rbac.dev/)
* [Understand Role-Based Access Control in Kubernetes](https://www.youtube.com/watch?v=G3R24JSlGjY)
* [Manage Role Based Access Control](https://github.com/David-VTUK/CKA-StudyGuide/blob/master/RevisionTopics/01-Cluster%20Architcture%2C%20Installation%20and%20Configuration.md)
* [Simplify Kubernetes Resource Access Control using RBAC Impersonation](https://docs.bitnami.com/tutorials/simplify-kubernetes-resource-access-rbac-impersonation/)

## Service Accounts

> Exercise caution in using service accounts e.g. disable defaults, minimize permissions on newly created ones

✨ [Managing Service Accounts](https://kubernetes.io/docs/reference/access-authn-authz/service-accounts-admin/),
[Configure Service Accounts for Pods](https://kubernetes.io/docs/tasks/configure-pod-container/configure-service-account/)

⚗️ [Practice](practice/2.3-service-accounts.md)

Additional:

* [Kubernetes should not mount default service account credentials by default](https://github.com/kubernetes/kubernetes/issues/57601)
* [Kubernetes: Creating Service Accounts and Kubeconfigs](https://docs.armory.io/docs/armory-admin/manual-service-account/)
* [Kubernetes Access Control: Exploring Service Accounts](https://thenewstack.io/kubernetes-access-control-exploring-service-accounts/)
* [Securing Kubernetes Clusters by Eliminating Risky Permissions](https://www.cyberark.com/resources/threat-research-blog/securing-kubernetes-clusters-by-eliminating-risky-permissions)

## Kubernetes updates

> Update Kubernetes frequently

✨ [Upgrade A Cluster](https://kubernetes.io/docs/tasks/administer-cluster/cluster-upgrade/),
[Upgrading kubeadm clusters](https://kubernetes.io/docs/tasks/administer-cluster/kubeadm/kubeadm-upgrade/)

---

🧵 Next: [System hardening](3-system-hardening.md)
