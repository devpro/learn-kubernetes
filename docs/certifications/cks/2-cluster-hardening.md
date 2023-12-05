# Kubernetes cluster hardening

## Content

> Restrict access to Kubernetes API

### Kubernetes API access

Official:

* [Securing a Cluster](https://kubernetes.io/docs/tasks/administer-cluster/securing-a-cluster/)
* [Controlling Access to the Kubernetes API](https://kubernetes.io/docs/concepts/security/controlling-access/)
* [How to issue a certificate for a user](https://kubernetes.io/docs/reference/access-authn-authz/certificate-signing-requests/#normal-user)
* [Generate Certificates Manually](https://kubernetes.io/docs/tasks/administer-cluster/certificates/)

Additional:

* [Hardening your GKE cluster's security](https://cloud.google.com/anthos/clusters/docs/on-prem/latest/how-to/hardening-your-cluster)
* [Kubernetes RBAC and TLS certificates – Kubernetes security guide](https://sysdig.com/blog/kubernetes-security-rbac-tls/)
* [Securing Your Kubernetes API Server](https://tufin.medium.com/protecting-your-kubernetes-api-server-5eefeea4cf8a)

### RBAC

> Use Role Based Access Controls to minimize exposure

Official:

* [Using RBAC Authorization](https://kubernetes.io/docs/reference/access-authn-authz/rbac/)
* [Authorization Overview](https://kubernetes.io/docs/reference/access-authn-authz/authorization/)

Additional:

* [RBAC.dev](https://rbac.dev/)
* [Understand Role-Based Access Control in Kubernetes](https://www.youtube.com/watch?v=G3R24JSlGjY)
* [Manage Role Based Access Control](https://github.com/David-VTUK/CKA-StudyGuide/blob/master/RevisionTopics/01-Cluster%20Architcture%2C%20Installation%20and%20Configuration.md)

### Service Accounts

> Exercise caution in using service accounts e.g. disable defaults, minimize permissions on newly created ones

Official:

* [Managing Service Accounts](https://kubernetes.io/docs/reference/access-authn-authz/service-accounts-admin/)
* [Configure Service Accounts for Pods](https://kubernetes.io/docs/tasks/configure-pod-container/configure-service-account/)

Additional:

* 🚀 [Examples](examples/2.3-service-accounts.md)
* [Kubernetes should not mount default service account credentials by default](https://github.com/kubernetes/kubernetes/issues/57601)
* [Kubernetes: Creating Service Accounts and Kubeconfigs](https://docs.armory.io/docs/armory-admin/manual-service-account/)
* [Kubernetes Access Control: Exploring Service Accounts](https://thenewstack.io/kubernetes-access-control-exploring-service-accounts/)
* [Securing Kubernetes Clusters by Eliminating Risky Permissions](https://www.cyberark.com/resources/threat-research-blog/securing-kubernetes-clusters-by-eliminating-risky-permissions)

## Kubernetes updates

> Update Kubernetes frequently

Official:

* [Upgrading kubeadm clusters](https://kubernetes.io/docs/tasks/administer-cluster/kubeadm/kubeadm-upgrade/)
