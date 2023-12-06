# Monitoring, logging and runtime security

## Content

### Syscalls

> Perform behavioral analytics of syscall process and file activities at the host and container level to detect malicious activities

Additional:

* [How to detect a Kubernetes vulnerability using Falco](https://sysdig.com/blog/how-to-detect-kubernetes-vulnerability-cve-2019-11246-using-falco/)
* [Kubernetes Security monitoring at scale](https://medium.com/@SkyscannerEng/kubernetes-security-monitoring-at-scale-with-sysdig-falco-a60cfdb0f67a)
* [seccomp](tools/seccomp.md)
* [Falco](tools/falco.md)
* 🚀 [Practice](practice/6.1-syscalls.md)
* [strace](https://strace.io/)

### Threat detection

> Detect threats within physical infrastructure, apps, networks, data, users and workloads

Additional:

* [Threat matrix for Kubernetes, by Microsoft](https://www.microsoft.com/en-us/security/blog/2020/04/02/attack-matrix-kubernetes/) - May 10, 2021
* [Common Kubernetes config security threats](https://www.cncf.io/blog/2020/08/07/common-kubernetes-config-security-threats/) - August 7, 2020
* [Guidance on Kubernetes Threat Modeling, by Trend Micro](https://www.trendmicro.com/vinfo/us/security/news/virtualization-and-cloud/guidance-on-kubernetes-threat-modeling) - April 27, 2020

### Attack phases

> Detect all phases of attack regardless where it occurs and how it spreads

* [Investigating Kubernetes attack scenarios in Threat Stack](https://www.threatstack.com/blog/kubernetes-attack-scenarios-part-1)
* [Anatomy of a Kubernetes attack – How untrusted Docker images fails us](https://www.optiv.com/explore-optiv-insights/source-zero/anatomy-kubernetes-attack-how-untrusted-docker-images-fail-us)
* [Investigating Kubernetes Attack Scenarios in Threat Stack (part 1)](https://www.threatstack.com/blog/kubernetes-attack-scenarios-part-1)
* [The seven phases of a cyber attack](https://www.dnvgl.com/article/the-seven-phases-of-a-cyber-attack-118270)
* [Threat matrix for Kubernetes](https://www.microsoft.com/security/blog/2020/04/02/attack-matrix-kubernetes/)
* [MITRE ATT&CK framework for container runtime security with Falco](https://sysdig.com/blog/mitre-attck-framework-for-container-runtime-security-with-sysdig-falco/)
* [Mitigating Kubernetes attacks](https://www.youtube.com/watch?v=HWv8ZKLCawM)

### Analysis

> Perform deep analytical investigation and identification of bad actors within environment

* [Kubernetes security 101: Risks and Best practices](https://www.stackrox.com/post/2020/05/kubernetes-security-101/)

### Immutability

> Ensure immutability of containers at runtime

* ["ReadOnlyRootFilesystem" (securityContext, PSP)](https://kubernetes.io/docs/concepts/policy/pod-security-policy/#volumes-and-file-systems)
* ["readOnly" volume mount](https://kubernetes.io/docs/concepts/policy/pod-security-policy/#volumes-and-file-systems)
* [Principles of Container-based Application Design](https://kubernetes.io/blog/2018/03/principles-of-container-app-design/)

Additional:

* [Container security and immutability](https://gianarb.it/blog/container-security-immutability) - June 5, 2017

* [Leverage Kubernetes to ensure that containers are immutable](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux_atomic_host/7/html/container_security_guide/keeping_containers_fresh_and_updateable#leveraging_kubernetes_and_openshift_to_ensure_that_containers_are_immutable)
* [Why I think we should all use immutable Docker images](https://medium.com/sroze/why-i-think-we-should-all-use-immutable-docker-images-9f4fdcb5212f)
* [With immutable infrastructure, your systems can rise from the dead](https://techbeacon.com/enterprise-it/immutable-infrastructure-your-systems-can-rise-dead)

### Audit logs

> Use Audit Logs to monitor access

Official:

* [Auditing](https://kubernetes.io/docs/tasks/debug/debug-cluster/audit/)

Additional:

* 🚀 [Practice](practice/6.6-auditing-examples.md)

* [Kubernetes Audit](https://kubernetes.io/docs/tasks/debug-application-cluster/audit/)
* [Kubernetes Audit logging](https://docs.sysdig.com/en/kubernetes-audit-logging.html)

* [How to monitor Kubernetes audit logs?](https://www.datadoghq.com/blog/monitor-kubernetes-audit-logs/)
* [Kubernetes Audit: Making Log Auditing a Viable Practice Again](https://blog.alcide.io/kubernetes-audit-making-log-auditing-a-viable-practice-again)

