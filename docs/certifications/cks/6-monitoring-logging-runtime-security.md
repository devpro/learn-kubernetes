# Monitoring, logging and runtime security

## Behavioral analytics

> Perform behavioral analytics of syscall process and file activities at the host and container level to detect malicious activities

✨ [Falco binary](https://falco.org/docs/install-operate/running/#falco-binary)

🚀 [Falco](tools/falco.md)

💡 Tips:

* Learn to use Falco from the command line and write Falco rule file

⚗️ [Practice](practice/6.1-behavioral-analytics.md)

📝 Read more:

* [How to detect a Kubernetes vulnerability using Falco](https://sysdig.com/blog/how-to-detect-kubernetes-vulnerability-cve-2019-11246-using-falco/)
* [Kubernetes Security monitoring at scale](https://medium.com/@SkyscannerEng/kubernetes-security-monitoring-at-scale-with-sysdig-falco-a60cfdb0f67a)
* [strace](https://strace.io/)

## Threat detection

> Detect threats within physical infrastructure, apps, networks, data, users and workloads

📝 Read more:

* [Threat matrix for Kubernetes, by Microsoft](https://www.microsoft.com/en-us/security/blog/2020/04/02/attack-matrix-kubernetes/) - May 10, 2021
* [Common Kubernetes config security threats](https://www.cncf.io/blog/2020/08/07/common-kubernetes-config-security-threats/) - August 7, 2020
* [Guidance on Kubernetes Threat Modeling, by Trend Micro](https://www.trendmicro.com/vinfo/us/security/news/virtualization-and-cloud/guidance-on-kubernetes-threat-modeling) - April 27, 2020

## Attack phases

> Detect all phases of attack regardless where it occurs and how it spreads

📝 Read more:

* [Investigating Kubernetes attack scenarios in Threat Stack](https://www.threatstack.com/blog/kubernetes-attack-scenarios-part-1)
* [Anatomy of a Kubernetes attack – How untrusted Docker images fails us](https://www.optiv.com/explore-optiv-insights/source-zero/anatomy-kubernetes-attack-how-untrusted-docker-images-fail-us)
* [Investigating Kubernetes Attack Scenarios in Threat Stack (part 1)](https://www.threatstack.com/blog/kubernetes-attack-scenarios-part-1)
* [The seven phases of a cyber attack](https://www.dnvgl.com/article/the-seven-phases-of-a-cyber-attack-118270)
* [Threat matrix for Kubernetes](https://www.microsoft.com/security/blog/2020/04/02/attack-matrix-kubernetes/)
* [MITRE ATT&CK framework for container runtime security with Falco](https://sysdig.com/blog/mitre-attck-framework-for-container-runtime-security-with-sysdig-falco/)
* [Mitigating Kubernetes attacks](https://www.youtube.com/watch?v=HWv8ZKLCawM)

## Analysis

> Perform deep analytical investigation and identification of bad actors within environment

📝 Read more:

* [Kubernetes security 101: Risks and Best practices](https://www.stackrox.com/post/2020/05/kubernetes-security-101/)

## Immutability

> Ensure immutability of containers at runtime

✨ [Configure a Security Context for a Pod or Container](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/),
["readOnly" volume mount](https://kubernetes.io/docs/concepts/policy/pod-security-policy/#volumes-and-file-systems),
[Principles of Container-based Application Design](https://kubernetes.io/blog/2018/03/principles-of-container-app-design/)

⚗️ [Practice](practice/6.5-immutability.md)

💡 Tips:

* Use `readOnlyRootFilesystem` to mount the container's root filesystem as read-only.
* Use `readOnly: true` in volumeMounts

📝 Read more:

* [Container security and immutability](https://gianarb.it/blog/container-security-immutability) - June 5, 2017

## Audit logs

> Use Audit Logs to monitor access

✨ [Auditing](https://kubernetes.io/docs/tasks/debug/debug-cluster/audit/)

⚗️ [Practice](practice/6.6-auditing.md)

📝 Read more:

* [Sysdig Kubernetes Audit Logging](https://docs.sysdig.com/en/docs/sysdig-secure/secure-events/kubernetes-audit-logging/)
* [Datadog How to monitor Kubernetes audit logs](https://www.datadoghq.com/blog/monitor-kubernetes-audit-logs/)

---

🧵 Next: [Home](README.md)
