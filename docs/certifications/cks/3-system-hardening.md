# System Hardening

> Minimize host OS footprint (reduce attack surface)  
> Minimize IAM roles  
> Minimize external access to the network  
> Appropriately use kernel hardening tools such as AppArmor, seccomp  

## Content

### OS footprint

* [CIS Benchmarks](https://www.cisecurity.org/benchmark)
  * [Distribution Independent Linux](https://www.cisecurity.org/benchmark/distribution_independent_linux/)
  * [Ubuntu Linux](https://www.cisecurity.org/benchmark/ubuntu_linux)

### Identity and Access Management (IAM) roles

* [AWS security best practices in IAM](https://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html#grant-least-privilege)

### External access

* AWS: [Control traffic to subnets using network ACLs (Access Control List)](https://docs.aws.amazon.com/vpc/latest/userguide/vpc-network-acls.html), [Amazon EC2 security groups for Linux instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-security-groups.html)
* OS firewall

### Kernel hardening

* AppArmor
  * [Restrict a Container's Access to Resources with AppArmor](https://kubernetes.io/docs/tutorials/security/apparmor/)
  * [AppArmor documentation](https://gitlab.com/apparmor/apparmor/-/wikis/Documentation)
* seccomp
  * [Restrict a Container's Syscalls with seccomp](https://kubernetes.io/docs/tutorials/security/seccomp/)
