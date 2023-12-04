# CKS - Cluster Hardening

> Restrict access to Kubernetes API  
> Use Role Based Access Controls to minimize exposure  
> Exercise caution in using service accounts e.g. disable defaults, minimize permissions on newly created ones  
> Update Kubernetes frequently  

## Documentation

* [Securing a Cluster](https://kubernetes.io/docs/tasks/administer-cluster/securing-a-cluster/)

## Content

### Kubernetes API access

Official documentation:

* [Controlling Access to the Kubernetes API](https://kubernetes.io/docs/concepts/security/controlling-access/)
* [How to issue a certificate for a user](https://kubernetes.io/docs/reference/access-authn-authz/certificate-signing-requests/#normal-user)
* [Generate Certificates Manually](https://kubernetes.io/docs/tasks/administer-cluster/certificates/)

Additional resources:

* [Hardening your GKE cluster's security](https://cloud.google.com/anthos/clusters/docs/on-prem/latest/how-to/hardening-your-cluster)
* [Kubernetes RBAC and TLS certificates – Kubernetes security guide](https://sysdig.com/blog/kubernetes-security-rbac-tls/)
* [Securing Your Kubernetes API Server](https://tufin.medium.com/protecting-your-kubernetes-api-server-5eefeea4cf8a)

### RBAC

Official documentation:

* [Using RBAC Authorization](https://kubernetes.io/docs/reference/access-authn-authz/rbac/)
* [Authorization Overview](https://kubernetes.io/docs/reference/access-authn-authz/authorization/)

Additional resources:

* [RBAC.dev](https://rbac.dev/)
* [Understand Role-Based Access Control in Kubernetes](https://www.youtube.com/watch?v=G3R24JSlGjY)
* [Manage Role Based Access Control](https://github.com/David-VTUK/CKA-StudyGuide/blob/master/RevisionTopics/01-Cluster%20Architcture%2C%20Installation%20and%20Configuration.md)
