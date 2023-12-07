# Minimize microservice vulnerabilities

## Security domains

> Setup appropriate OS level security domains

✨ [Pod Security Admission](https://kubernetes.io/docs/concepts/security/pod-security-admission/), ~~[Pod Security Policies](https://kubernetes.io/docs/concepts/policy/pod-security-policy/)~~, [Configure a Security Context for a Pod or Container](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/), [OPA Gatekeeper: Policy and Governance for Kubernetes](https://kubernetes.io/blog/2019/08/06/opa-gatekeeper-policy-and-governance-for-kubernetes/)

⚗️ [Practice](practice/4.1-security-domains.md)

Tips:

* Make sure to review the values of sensitive fields of SecurityContext: runAsUser, allowPrivilegeEscalation, readOnlyRootFilesystem

Additional:

* [Kubernetes security context, security policy, and network policy – Kubernetes security guide (part 2)](https://sysdig.com/blog/kubernetes-security-psp-network-policy/) - April 4, 2018
* [KubeCon 2019 - Open Policy Agent Introduction](https://www.youtube.com/watch?v=Yup1FUc2Qn0)
* [OPA Gatekeeper: Overview & Architecture](https://www.openpolicyagent.org/docs/latest/kubernetes-introduction/)

## Secrets

> Manage Kubernetes secrets

✨ [Secrets](https://kubernetes.io/docs/concepts/configuration/secret/), [Encrypting Confidential Data at Rest](https://kubernetes.io/docs/tasks/administer-cluster/encrypt-data/), [Using a KMS provider for data encryption](https://kubernetes.io/docs/tasks/administer-cluster/kms-provider/)

[Practice](practice/4.2-secrets.md)

Additional:

* [Secrets Store CSI Driver](https://secrets-store-csi-driver.sigs.k8s.io/)
* [How to Manage Secrets in Kubernetes, by Spacelift](https://spacelift.io/blog/kubernetes-secrets) - October 25, 2022
* [Managing Secrets in Kubernetes, by Weaveworks](https://www.weave.works/blog/managing-secrets-in-kubernetes) - January 15, 2019

## Sandboxes

> Use container runtime sandboxes in multi-tenant environments (e.g. gvisor, kata containers)

✨ [Runtime Class](https://kubernetes.io/docs/concepts/containers/runtime-class/)

⚗️ [Practice](practice/4.3-sandboxes.md)

🚀 [gVisor](tools/gvisor.md), [Kata Containers](tools/katacontainers.md)

Additional:

* [sig-node/585-runtime-class/examples](https://github.com/kubernetes/enhancements/blob/master/keps/sig-node/585-runtime-class/README.md#examples)

## Encryption

> Implement pod to pod encryption by use of mTLS (mutual Transport Layer Security)

✨ [Manage TLS Certificates in a Cluster](https://kubernetes.io/docs/tasks/tls/managing-tls-in-a-cluster/)

Additonal:

* [What is mutual TLS (mTLS)? by Cloudflare](https://www.cloudflare.com/learning/access-management/what-is-mutual-tls/)
* [Traffic encryption using mTLS with Istio](https://www.istioworkshop.io/11-security/01-mtls/)
* [Using Istio to Improve End-to-End Security](https://istio.io/latest/blog/2017/0.1-auth/) - May 25, 2017
* [A Kubernetes engineer’s guide to mTLS by Buoyant](https://buoyant.io/mtls-guide)
* [Automatic mTLS by Linkerd](https://linkerd.io/2/features/automatic-mtls/)
* [Mutual TLS: Securing Microservices in Service Mesh](https://thenewstack.io/mutual-tls-microservices-encryption-for-service-mesh/) - February 1, 2021

---

🧵 Next: [Supply chain security](5-supply-chain-security.md)
