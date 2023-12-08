#  CKS (Certified Kubernetes Security Specialist)

> The program provides assurance that a CKS has the skills, knowledge, and competence on a broad range of best practices for securing container-based applications and Kubernetes platforms during build, deployment and runtime.
>
> &mdash; <cite>[training.linuxfoundation.org/certification](https://training.linuxfoundation.org/certification/certified-kubernetes-security-specialist/)</cite>

🚩 A valid CKA certification is required to try this exam

🌐 [Training Portal (Linux Foundation)](https://trainingportal.linuxfoundation.org/learn/dashboard), [PSI Exams Portal](https://test-takers.psiexams.com/linux/manage/my-tests), [Exam Instructions](https://docs.linuxfoundation.org/tc-docs/certification/important-instructions-cks)

## Curriculum

* [1. Cluster setup](1-cluster-setup.md)
* [2. Cluster hardening](2-cluster-hardening.md)
* [3. System hardening](3-system-hardening.md)
* [4. Minimize microservice vulnerabilities](4-minimize-microservice-vulnerabilities.md)
* [5. Supply chain security](5-supply-chain-security.md)
* [6. Monitoring, logging and runtime security](6-monitoring-logging-runtime-security.md)

## Examination resources

### Allowed websites

Component      | Links
---------------|-----------------------------------------------------------------------------------------------------------------
**Kubernetes** | [kubernetes.io/docs](https://kubernetes.io/docs/), [kubernetes.io/blog](https://kubernetes.io/blog/)
**etcd**       | [etcd.io/docs](https://etcd.io/docs/)
**AppArmor**   | [gitlab.com/apparmor/apparmor/-/wikis/Documentation](https://gitlab.com/apparmor/apparmor/-/wikis/Documentation)
**Falco**      | [falco.org/docs](https://falco.org/docs/)
**Trivy**      | [aquasecurity.github.io/trivy](https://aquasecurity.github.io/trivy/)

📌 Source: [Resources Allowed: All LF Certification Programs](https://docs.linuxfoundation.org/tc-docs/certification/certification-resources-allowed#certified-kubernetes-security-specialist-cks)

### Helpers

* [`kubectl` cheat sheet](https://kubernetes.io/docs/reference/kubectl/cheatsheet/)
* [`kubectl` commands](https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands)
* [Debugging Kubernetes nodes with `crictl`](https://kubernetes.io/docs/tasks/debug/debug-cluster/crictl/) (`crictl -r /var/run/containerd/containerd.sock ps`)

## General documentation

* Kubernetes
  * [Pod Security Standards](https://kubernetes.io/docs/concepts/security/pod-security-standards/)
  * [Policies](https://kubernetes.io/docs/concepts/policy/)
  * [Securing a Cluster](https://kubernetes.io/docs/tasks/administer-cluster/securing-a-cluster/)
  * [11 Ways (Not) to Get Hacked: statically-analyse-yaml](https://kubernetes.io/blog/2018/07/18/11-ways-not-to-get-hacked/)
* AWS
  * [EKS best practices guide for security](https://aws.github.io/aws-eks-best-practices/security/docs/)
* Google Cloud
  * [GKE security overview](https://cloud.google.com/kubernetes-engine/docs/concepts/security-overview)
  * [Harden your GKE cluster's security](https://cloud.google.com/kubernetes-engine/docs/how-to/hardening-your-cluster)

## Training

* **A Cloud Guru**: [Kubernetes Security](https://learn.acloud.guru/course/7d2c29e7-cdb2-4f44-8744-06332f47040e/dashboard), [CKS](https://learn.acloud.guru/course/certified-kubernetes-security-specialist/dashboard)
* **KodeKloud**: [CKS](https://kodekloud.com/courses/certified-kubernetes-security-specialist-cks/), [CKS Challenges (Free)](https://kodekloud.com/courses/certified-kubernetes-security-specialist-cks/)
  * [Course notes](https://github.com/kodekloudhub/certified-kubernetes-security-specialist-cks-course)
* **LinkedIn Learning**: [Securing Containers and Kubernetes Ecosystem](https://www.linkedin.com/learning/securing-containers-and-kubernetes-ecosystem/protect-your-containers-and-kubernetes-ecosystem)
* **Linux Foundation**: [Kubernetes Security Essentials (LFS260)](https://training.linuxfoundation.org/training/kubernetes-security-essentials-lfs260/)
* **Udemy**: [CKS 2023](https://www.udemy.com/course/certified-kubernetes-security-specialist/)

## Tools

Name                                       | Paragraph                                                                                 | Kubernetes definition
-------------------------------------------|-------------------------------------------------------------------------------------------|---------------------------------------------------------------
[AppArmor](tools/apparmor.md)              | [3.4 Kernel hardening](3-system-hardening.md#kernel-hardening)                            | annotations.`container.apparmor.security.beta.kubernetes.io`
[Falco](tools/falco.md)                    | [6.1 Behavioral analytics](6-monitoring-logging-runtime-security.md#behavioral-analytics) | 
[gVisor](tools/gvisor.md)                  | [4.3 Sandboxes](4-minimize-microservice-vulnerabilities.md#sandboxes)                     | spec.`runtimeClassName`
[Kata Containers](tools/katacontainers.md) | [4.3 Sandboxes](4-minimize-microservice-vulnerabilities.md#sandboxes)                     |
[kube-bench](tools/kube-bench.md)          | [1.2 CIS benchmark](1-cluster-setup.md#cis-benchmark)                                     |
[seccomp](tools/seccomp.md)                | [3.4 Kernel hardening](3-system-hardening.md#kernel-hardening)                            | securityContext.`seccompProfile`
[SELinux](tools/selinux.md)                |                                                                                           |
[Trivy](tools/trivy.md)                    | [5. Supply chain security](5-supply-chain-security.md#workload-static-analysis)           |

## Lab platforms

* [CKS CLI](https://cks.kubernetes.tn/)
* [Cloud Native Security Tutorial](https://tutorial.kubernetes-security.info/)
* [Killercoda](https://killercoda.com/killer-shell-cks)
* [Killer Shell](https://github.com/killer-sh/cks-course-environment)
* [Kubernetes Goat](https://madhuakula.com/kubernetes-goat/)

## Other resources

### Companies

* [K21Academy - Step-by-Step Activity Guide (Hands-on Lab)](https://k21academy.com/docker-kubernetes/certified-kubernetes-security-specialist-cks-step-by-step-activity-guide-hands-on-lab/#)
* [StackRox - CKS Study Guide](https://github.com/stackrox/Kubernetes_Security_Specialist_Study_Guide)
* [Sumologic - Kubernetes DevSecOps vulnerabilities and best practices](https://www.sumologic.com/blog/kubernetes-devsecops/) - December 8, 2022

### Documents

* [CNCF Cloud Native Security Whitepaper](https://github.com/cncf/tag-security/tree/main/security-whitepaper)
  * [PDF file (2022-05)](https://github.com/cncf/tag-security/blob/main/security-whitepaper/v2/CNCF_cloud-native-security-whitepaper-May2022-v2.pdf)
* [NSA, CISA release Kubernetes Hardening Guidance](https://www.nsa.gov/Press-Room/News-Highlights/Article/Article/2716980/nsa-cisa-release-kubernetes-hardening-guidance/) - March 15, 2022
  * [PDF file (2022-08)](https://media.defense.gov/2022/Aug/29/2003066362/-1/-1/0/CTR_KUBERNETES_HARDENING_GUIDANCE_1.2_20220829.PDF)
* [Sysdig Kubernetes Security Guide](https://sysdig.com/s-kubernetes-security-guide/)

### Inviduals

* [Alessandro Vozza](https://medium.com/@ams0): [script](https://gist.githubusercontent.com/ams0/0e57d15d53782c2c2259cce8545caa70/raw/d4e0686e4dc068ea146717af5d5a7be3dab97a4c/kubeadm-containerd.sh), [Terraform](https://github.com/ams0/CKS/blob/main/kubeadm-containerd-multinode/readme.md)
* Benjamin Muschko:
  * [CKS crash course](https://github.com/bmuschko/cks-crash-course)
  * [CKS study guide](https://github.com/bmuschko/cks-study-guide)
* [DevOpsCube - How to Setup Kubernetes Cluster on Vagrant VMs](https://devopscube.com/kubernetes-cluster-vagrant/)
* [Dmitri Lerko - Exam Preparation Guide](https://deploy.live/blog/cks-certified-kubernetes-security-specialist-exam-preparation-guide/)
* [Kim Wuestkamp](https://wuestkamp.medium.com/): [UCKS Exam Series #1 Create Cluster & Security Best Practices](https://itnext.io/cks-exam-series-1-create-cluster-security-best-practices-50e35aaa67ae)
* [Ibrahim Jelliti](https://github.com/ibrahimjelliti/CKSS-Certified-Kubernetes-Security-Specialist)
* [Jaxon](https://github.com/theJaxon/CKS)
* [Jayendra Patil - CKS Learning path](https://jayendrapatil.com/certified-kubernetes-security-specialist-cks-learning-path/)
  * [Kubernetes exercise](https://github.com/jayendrapatil/kubernetes-exercises)
* [Mohamed Abukar - CKS Exercises](https://github.com/moabukar/CKS-Exercises-Certified-Kubernetes-Security-Specialist)
* Piotr Zaniewski: [Kubernetes related networking commands](https://gist.github.com/Piotr1215/23cf678d74079f98dc7be731e6a3f1d1#file-cka-networking-commands-md), [kubectl commands and tips & tricks](https://gist.github.com/Piotr1215/443fb83c89958139f0c67ec70b111da2#file-kubectl-commands-md), [K8s bookmarks](https://gist.github.com/Piotr1215/016ba7218a1a949574786fb9b92382c1#file-k8s-bookmarks-cka-ckad-html)
* [Scott Hawkins](https://github.com/echoboomer/k8s-cks-notes)
* [Snigdha Sambit Aryakumar](https://github.com/snigdhasambitak/cks)
* [Viktar Mikalayeu](https://github.com/ViktorUJ/cks)
* [Walid Shaari - CKS Resource list](https://github.com/walidshaari/Certified-Kubernetes-Security-Specialist)

### Videos

* [CKS KodeKloud Mock Exam 1 - Learn With GGS](https://www.youtube.com/watch?v=7eH7vfT0axA&list=PLglXbBWxN2H9-ATq0ShHVlMWskhRgvdJz) - Dec 6, 2021
* [Kubesimplify - Kubernetes security concepts and demos](https://youtu.be/VjlvS-qiz_U) - September 25, 2020
* [CNCF Tutorial - Getting Started With Cloud Native Security](https://youtu.be/MisS3wSds40) - September 4, 2020
* [Kubernetes Forum Seoul 2019 - Kubernetes Security Best Practices](https://youtu.be/wqsUfvRyYpw) - Dec 10, 2019
