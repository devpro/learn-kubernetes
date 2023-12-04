# Kubernetes cluster setup

> Use Network security policies to restrict cluster level access  
> Use CIS benchmark to review the security configuration of Kubernetes components (etcd, kubelet, kubedns, kubeapi)  
> Properly set up Ingress objects with security control  
> Protect node metadata and endpoints  
> Minimize use of, and access to, GUI elements  
> Verify platform binaries before deploying

## Content

### Network Policies

> NetworkPolicies are an application-centric construct which allow you to specify how a pod is allowed to communicate with various network "entities" over the network.  
>
> Network policies do not conflict; they are additive.  
>
> &mdash; <cite>[kubernetes.io/docs/concepts/services-networking/network-policies](https://kubernetes.io/docs/concepts/services-networking/network-policies)</cite>

See also:

* [Declare Network Policy](https://kubernetes.io/docs/tasks/administer-cluster/declare-network-policy/)
* [Enforcing Network Policies in Kubernetes](https://kubernetes.io/blog/2017/10/enforcing-network-policies-in-kubernetes/)

Additional:

* 🚀 [Examples](examples/1.1-network-policies.md)
* [Get started with Kubernetes network policy](https://docs.projectcalico.org/security/kubernetes-network-policy)
* [kubernetes-network-policy-recipes](https://github.com/ahmetb/kubernetes-network-policy-recipes)
* [An Introduction to Kubernetes Network Policies for Security People](https://reuvenharrison.medium.com/an-introduction-to-kubernetes-network-policies-for-security-people-ba92dd4c809d)
* [test-network-policies](https://github.com/Tufin/test-network-policies)

### CIS Benchmark

> This Center for Internet Security (CIS) Benchmark is the product of a community consensus process and consists of secure configuration guidelines developed for Kubernetes.  
>
> &mdash; <cite>[cisecurity.org/benchmark/kubernetes](https://www.cisecurity.org/benchmark/kubernetes/)</cite>

Additional:

* 🚀 [Examples](examples/1.2-cis-benchmark.md)
* [Microsoft Compliance](https://docs.microsoft.com/en-us/microsoft-365/compliance/offering-cis-benchmark)
* [Default values on GKE](https://cloud.google.com/kubernetes-engine/docs/concepts/cis-benchmarks#default-values) 
* [InSpec Profile](https://github.com/dev-sec/cis-kubernetes-benchmark)

### Ingress

Official:

* [Ingress](https://kubernetes.io/docs/concepts/services-networking/ingress/)
* [Ingress Controllers](https://kubernetes.io/docs/concepts/services-networking/ingress-controllers/)
* [Set up Ingress on Minikube with the NGINX Ingress Controller](https://kubernetes.io/docs/tasks/access-application-cluster/ingress-minikube/)

Additional:

* Ingress-Nginx Controller: [Installation Guide](https://kubernetes.github.io/ingress-nginx/deploy/), [TLS/HTTPS](https://kubernetes.github.io/ingress-nginx/user-guide/tls/)

### Node metadata and endpoints protection

Official:

* [Restricting cloud metadata API access](https://kubernetes.io/docs/tasks/administer-cluster/securing-a-cluster/#restricting-cloud-metadata-api-access)
* [Kubelet authentication/authorization](https://kubernetes.io/docs/reference/access-authn-authz/kubelet-authn-authz/)

Additional:

* [Kubelet API](https://www.deepnetwork.com/blog/2020/01/13/kubelet-api.html)
* [Setting up secure endpoints in Kubernetes](https://blog.cloud66.com/setting-up-secure-endpoints-in-kubernetes)
* [GKE Protecting cluster metadata](https://cloud.google.com/kubernetes-engine/docs/how-to/protecting-cluster-metadata)
* [Retrieving EC2 instance metadata](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instancedata-data-retrieval.html)
* [EC2 Instance user data](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-metadata.html)

### GUI elements restriction

Official:

* [Deploy and Access the Kubernetes Dashboard](https://kubernetes.io/docs/tasks/access-application-cluster/web-ui-dashboard/)

Additional:

* [Dashboard Access control](https://github.com/kubernetes/dashboard/blob/master/docs/user/access-control/README.md)
* [Dashboard Creating sample user](https://github.com/kubernetes/dashboard/blob/master/docs/user/access-control/creating-sample-user.md)
* [On Securing the Kubernetes Dashboard](https://blog.heptio.com/on-securing-the-kubernetes-dashboard-16b09b1b7aca)

### Verify platform binaries before deploying

Additional :

* [Kubernetes platform binaries](https://github.com/kubernetes/kubernetes/releases)
