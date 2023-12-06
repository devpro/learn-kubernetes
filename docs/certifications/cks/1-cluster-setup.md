# Kubernetes cluster setup

## Network Policies

> Use Network security policies to restrict cluster level access  

[Network Policies](https://kubernetes.io/docs/concepts/services-networking/network-policies) are "an application-centric construct which allow you to specify how a pod is allowed to communicate with various network _entities_ over the network". They "do not conflict; they are additive".

See also: [Declare Network Policy](https://kubernetes.io/docs/tasks/administer-cluster/declare-network-policy/), [Enforcing Network Policies in Kubernetes](https://kubernetes.io/blog/2017/10/enforcing-network-policies-in-kubernetes/)

🚀 [Practice](practice/1.1-network-policies.md)

Additional:

* [Get started with Kubernetes network policy, by Calico](https://docs.projectcalico.org/security/kubernetes-network-policy)
* [Kubernetes Network Policy Recipes, Ahmet Alp Balkan](https://github.com/ahmetb/kubernetes-network-policy-recipes)
* [An Introduction to Kubernetes Network Policies for Security People](https://reuvenharrison.medium.com/an-introduction-to-kubernetes-network-policies-for-security-people-ba92dd4c809d)
* [Network policies testing, by Tufin](https://github.com/Tufin/test-network-policies)
* [Anthos security blueprint: Restricting traffic](https://github.com/GoogleCloudPlatform/anthos-security-blueprints/tree/master/restricting-traffic)
* [Kubernetes Network Policies Viewer](https://orca.tufin.io/netpol/)

## CIS Benchmark

> Use CIS benchmark to review the security configuration of Kubernetes components (etcd, kubelet, kubedns, kubeapi)

This [Center for Internet Security (CIS) Kubernetes Benchmark](https://www.cisecurity.org/benchmark/kubernetes/) is the product of a community consensus process and consists of secure configuration guidelines developed for Kubernetes.

🚀 [Practice](practice/1.2-cis-benchmark.md)
🗃️ [Kube-bench](tools/kube-bench.md)

Additional:

* [Microsoft Compliance](https://docs.microsoft.com/en-us/microsoft-365/compliance/offering-cis-benchmark)
* [GKE > CIS Benchmarks](https://cloud.google.com/kubernetes-engine/docs/concepts/cis-benchmarks) 
* [InSpec Profile](https://github.com/dev-sec/cis-kubernetes-benchmark)

## Ingress

> Properly set up Ingress objects with security control

Official:

* [Ingress > TLS](https://kubernetes.io/docs/concepts/services-networking/ingress/#tls)
* [Ingress Controllers](https://kubernetes.io/docs/concepts/services-networking/ingress-controllers/)
* [Set up Ingress on Minikube with the NGINX Ingress Controller](https://kubernetes.io/docs/tasks/access-application-cluster/ingress-minikube/)

🚀 [Practice](practice/1.3-ingress.md)

Additional:

* Ingress-Nginx Controller: [Installation Guide](https://kubernetes.github.io/ingress-nginx/deploy/), [TLS/HTTPS](https://kubernetes.github.io/ingress-nginx/user-guide/tls/)

## Node metadata and endpoints

> Protect node metadata and endpoints

Official:

* [Restricting cloud metadata API access](https://kubernetes.io/docs/tasks/administer-cluster/securing-a-cluster/#restricting-cloud-metadata-api-access)
* [Kubelet authentication/authorization](https://kubernetes.io/docs/reference/access-authn-authz/kubelet-authn-authz/)
* [Set Kubelet Parameters Via A Configuration File](https://kubernetes.io/docs/tasks/administer-cluster/kubelet-config-file/)

Additional:

* [Kubelet API, by Deep Network](https://www.deepnetwork.com/blog/2020/01/13/kubelet-api.html)
* [Setting up secure endpoints in Kubernetes](https://blog.cloud66.com/setting-up-secure-endpoints-in-kubernetes)
* [GKE Protecting cluster metadata](https://cloud.google.com/kubernetes-engine/docs/how-to/protecting-cluster-metadata)
* [Retrieving EC2 instance metadata](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instancedata-data-retrieval.html)
* [EC2 Instance user data](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-metadata.html)

## GUI restriction

> Minimize use of, and access to, GUI elements

Official:

* [Deploy and Access the Kubernetes Dashboard](https://kubernetes.io/docs/tasks/access-application-cluster/web-ui-dashboard/)

Additional:

* [Dashboard Access control](https://github.com/kubernetes/dashboard/blob/master/docs/user/access-control/README.md)
* [Dashboard Creating sample user](https://github.com/kubernetes/dashboard/blob/master/docs/user/access-control/creating-sample-user.md)
* [On Securing the Kubernetes Dashboard](https://blog.heptio.com/on-securing-the-kubernetes-dashboard-16b09b1b7aca)

## Platform binaries

> Verify platform binaries before deploying

Perform MD5 checks on binaries against [official releases](https://github.com/kubernetes/kubernetes/releases). See [Learn How to Generate and Verify Files with MD5 Checksum in Linux](https://www.tecmint.com/generate-verify-check-files-md5-checksum-linux/) or [Ubuntu how-to sha256sum](https://help.ubuntu.com/community/HowToSHA256SUM).
