# Kubernetes cluster setup

## Network Policies

> Use Network security policies to restrict cluster level access  

✨ [Network Policies](https://kubernetes.io/docs/concepts/services-networking/network-policies), [Declare Network Policy](https://kubernetes.io/docs/tasks/administer-cluster/declare-network-policy/), [Enforcing Network Policies in Kubernetes](https://kubernetes.io/blog/2017/10/enforcing-network-policies-in-kubernetes/)

⚗️ [Practice](practice/1.1-network-policies.md)

Additional:

* [Get started with Kubernetes network policy, by Calico](https://docs.projectcalico.org/security/kubernetes-network-policy)
* [Kubernetes Network Policy Recipes, Ahmet Alp Balkan](https://github.com/ahmetb/kubernetes-network-policy-recipes)
* [An Introduction to Kubernetes Network Policies for Security People](https://reuvenharrison.medium.com/an-introduction-to-kubernetes-network-policies-for-security-people-ba92dd4c809d)
* [Network policies testing, by Tufin](https://github.com/Tufin/test-network-policies)
* [Anthos security blueprint: Restricting traffic](https://github.com/GoogleCloudPlatform/anthos-security-blueprints/tree/master/restricting-traffic)
* [Kubernetes Network Policies Viewer](https://orca.tufin.io/netpol/)

## CIS Benchmark

> Use CIS benchmark to review the security configuration of Kubernetes components (etcd, kubelet, kubedns, kubeapi)

⚗️ [Practice](practice/1.2-cis-benchmark.md)

🚀 [Kube-bench](tools/kube-bench.md)

Tips:

* The [Center for Internet Security (CIS) Kubernetes Benchmark](https://www.cisecurity.org/benchmark/kubernetes/) is the product of a community consensus process and consists of secure configuration guidelines developed for Kubernetes.

Additional:

* [Aqua > Kubernetes CIS Benchmark Best Practices](https://www.aquasec.com/cloud-native-academy/kubernetes-in-production/kubernetes-cis-benchmark-best-practices-in-brief/)
* [Microsoft Compliance](https://docs.microsoft.com/en-us/microsoft-365/compliance/offering-cis-benchmark)
* [GKE > CIS Benchmarks](https://cloud.google.com/kubernetes-engine/docs/concepts/cis-benchmarks) 
* [InSpec Profile](https://github.com/dev-sec/cis-kubernetes-benchmark)

## Ingress

> Properly set up Ingress objects with security control

✨ [Ingress > TLS](https://kubernetes.io/docs/concepts/services-networking/ingress/#tls), [Ingress Controllers](https://kubernetes.io/docs/concepts/services-networking/ingress-controllers/), [Set up Ingress on Minikube with the NGINX Ingress Controller](https://kubernetes.io/docs/tasks/access-application-cluster/ingress-minikube/)

⚗️ [Practice](practice/1.3-ingress.md)

Additional:

* Ingress-Nginx Controller: [Installation Guide](https://kubernetes.github.io/ingress-nginx/deploy/), [TLS/HTTPS](https://kubernetes.github.io/ingress-nginx/user-guide/tls/)

## Node protection

> Protect node metadata and endpoints

✨ [Restricting cloud metadata API access](https://kubernetes.io/docs/tasks/administer-cluster/securing-a-cluster/#restricting-cloud-metadata-api-access), [Kubelet authentication/authorization](https://kubernetes.io/docs/reference/access-authn-authz/kubelet-authn-authz/), [Set Kubelet Parameters Via A Configuration File](https://kubernetes.io/docs/tasks/administer-cluster/kubelet-config-file/)

⚗️ [Practice](practice/1.4-node-protection.md)

Additional:

* [Kubelet API, by Deep Network](https://www.deepnetwork.com/blog/2020/01/13/kubelet-api.html)
* [Setting up secure endpoints in Kubernetes](https://blog.cloud66.com/setting-up-secure-endpoints-in-kubernetes)
* [GKE Protecting cluster metadata](https://cloud.google.com/kubernetes-engine/docs/how-to/protecting-cluster-metadata)
* [Retrieving EC2 instance metadata](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instancedata-data-retrieval.html)
* [EC2 Instance user data](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-metadata.html)

## GUI restriction

> Minimize use of, and access to, GUI elements

✨ [Deploy and Access the Kubernetes Dashboard](https://kubernetes.io/docs/tasks/access-application-cluster/web-ui-dashboard/)

Additional:

* [Dashboard Access control](https://github.com/kubernetes/dashboard/blob/master/docs/user/access-control/README.md)
* [Dashboard Creating sample user](https://github.com/kubernetes/dashboard/blob/master/docs/user/access-control/creating-sample-user.md)
* [On Securing the Kubernetes Dashboard](https://blog.heptio.com/on-securing-the-kubernetes-dashboard-16b09b1b7aca)

## Platform binaries

> Verify platform binaries before deploying

✨ [Install and Set Up kubectl on Linux](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/)

Tips:

* Perform MD5 checks on binaries against [official releases](https://github.com/kubernetes/kubernetes/releases).

Additional:

* [Learn How to Generate and Verify Files with MD5 Checksum in Linux](https://www.tecmint.com/generate-verify-check-files-md5-checksum-linux/)
* [Ubuntu how-to sha256sum](https://help.ubuntu.com/community/HowToSHA256SUM).
