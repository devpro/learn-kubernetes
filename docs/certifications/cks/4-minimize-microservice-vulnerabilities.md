# Minimize microservice vulnerabilities

> Setup appropriate OS level security domains  
> Manage Kubernetes secrets  
> Use container runtime sandboxes in multi-tenant environments (e.g. gvisor, kata containers)  
> Implement pod to pod encryption by use of mTLS  

## Content

### Security domains

Official:

* [Pod Security Admission](https://kubernetes.io/docs/concepts/security/pod-security-admission/)
* ~~[Pod Security Policies](https://kubernetes.io/docs/concepts/policy/pod-security-policy/)~~
* [Configure a Security Context for a Pod or Container](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/)
* [OPA Gatekeeper: Policy and Governance for Kubernetes](https://kubernetes.io/blog/2019/08/06/opa-gatekeeper-policy-and-governance-for-kubernetes/) - August 6, 2019

Additional:

* [Kubernetes security context, security policy, and network policy – Kubernetes security guide (part 2)](https://sysdig.com/blog/kubernetes-security-psp-network-policy/) - April 4, 2018
* [KubeCon 2019 - Open Policy Agent Introduction](https://www.youtube.com/watch?v=Yup1FUc2Qn0)
* [OPA Gatekeeper: Overview & Architecture](https://www.openpolicyagent.org/docs/latest/kubernetes-introduction/)

### Secrets

Official:

* [Kubernetes Secrets](https://kubernetes.io/docs/concepts/configuration/secret/)
* [Encrypting Secret Data at Rest](https://kubernetes.io/docs/tasks/administer-cluster/encrypt-data/)
* [Using a KMS provider for data encryption](https://kubernetes.io/docs/tasks/administer-cluster/kms-provider/)

Additional:

* [Secrets Store CSI Driver](https://secrets-store-csi-driver.sigs.k8s.io/)
* [Spacelift - How to Manage Secrets in Kubernetes](https://spacelift.io/blog/kubernetes-secrets) - October 25, 2022
* [Weaveworks - Managing Secrets in Kubernetes](https://www.weave.works/blog/managing-secrets-in-kubernetes) - January 15, 2019

## Tools

### gvisor

### kata
