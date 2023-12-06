# System hardening

## Content

### OS footprint

> Minimize host OS footprint (reduce attack surface) 

Official:

* [Preventing containers from loading unwanted kernel modules](https://kubernetes.io/docs/tasks/administer-cluster/securing-a-cluster/#preventing-containers-from-loading-unwanted-kernel-modules)

Additional:

* [CIS Benchmarks](https://www.cisecurity.org/benchmark)
  * [Distribution Independent Linux](https://www.cisecurity.org/benchmark/distribution_independent_linux/)
  * [Ubuntu Linux](https://www.cisecurity.org/benchmark/ubuntu_linux)
* [Kubernetes Security Practices You Should Follow, by Sonatype](https://blog.sonatype.com/kubesecops-kubernetes-security-practices-you-should-follow) - August 29, 2019

### IAM roles

> Minimize IAM (Identity and Access Management) roles

* Principle of least privilege

Additional:

* [AWS Security best practices in IAM](https://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html)

### External access

> Minimize external access to the network

Additional:

* [Amazon EC2 security groups for Linux instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-security-groups.html)
* [Amazon EKS security group considerations](https://docs.aws.amazon.com/eks/latest/userguide/sec-group-reqs.html)
* [AWS Control traffic to subnets using network ACLs (Access Control List)](https://docs.aws.amazon.com/vpc/latest/userguide/vpc-network-acls.html)
* [Azure Security concepts for applications and clusters in AKS](https://learn.microsoft.com/en-us/azure/aks/concepts-security)
* OS firewall

### Kernel hardening

> Appropriately use kernel hardening tools such as AppArmor, seccomp  

* [AppArmor](tools/apparmor.md)
* [seccomp](tools/seccomp.md)
