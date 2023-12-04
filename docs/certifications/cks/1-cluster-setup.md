# CKS - Cluster Setup

> Use Network security policies to restrict cluster level access  
> Use CIS benchmark to review the security configuration of Kubernetes components (etcd, kubelet, kubedns, kubeapi)  
> Properly set up Ingress objects with security control  
> Protect node metadata and endpoints  
> Minimize use of, and access to, GUI elements  
> Verify platform binaries before deploying

## Content

### Network policies

Official documentation:

* [Network Policies](https://kubernetes.io/docs/concepts/services-networking/network-policies)
* [Declare Network Policy](https://kubernetes.io/docs/tasks/administer-cluster/declare-network-policy/)
* [Enforcing Network Policies in Kubernetes](https://kubernetes.io/blog/2017/10/enforcing-network-policies-in-kubernetes/)

Additional resources:

* [Get started with Kubernetes network policy](https://docs.projectcalico.org/security/kubernetes-network-policy)
* [kubernetes-network-policy-recipes](https://github.com/ahmetb/kubernetes-network-policy-recipes)

### Center for Internet Security (CIS) Benchmark

Additional resources:

* [CIS benchmark for Kubernetes](https://www.cisecurity.org/benchmark/kubernetes/)
* [Microsoft Compliance](https://docs.microsoft.com/en-us/microsoft-365/compliance/offering-cis-benchmark)
* [kube-bench](https://github.com/aquasecurity/kube-bench): tool that checks whether Kubernetes is deployed securely
* [Default values on GKE](https://cloud.google.com/kubernetes-engine/docs/concepts/cis-benchmarks#default-values) 

### Ingress objects with security control

Official documentation:

* [Ingress](https://kubernetes.io/docs/concepts/services-networking/ingress/)
* [Ingress Controllers](https://kubernetes.io/docs/concepts/services-networking/ingress-controllers/)
* [Set up Ingress on Minikube with the NGINX Ingress Controller](https://kubernetes.io/docs/tasks/access-application-cluster/ingress-minikube/)

Additional resources:

* [secure an Ingress by specifying a Secret that contains a TLS private key and certificate](https://kubernetes.io/docs/concepts/services-networking/ingress/#tls) 
* [How to deploy NGINX Ingress Controller](https://github.com/kubernetes/ingress-nginx/blob/master/docs/deploy/index.md)
* [TLS/HTTPS](https://github.com/kubernetes/ingress-nginx/blob/master/docs/user-guide/tls.md)


### Node metadata and endpoints protection

Official documentation:

* [Restricting cloud metadata API access](https://kubernetes.io/docs/tasks/administer-cluster/securing-a-cluster/#restricting-cloud-metadata-api-access)
* [Kubelet authentication/authorization](https://kubernetes.io/docs/reference/access-authn-authz/kubelet-authn-authz/)

Additional resources:

* [Kubelet API](https://www.deepnetwork.com/blog/2020/01/13/kubelet-api.html)
* [Setting up secure endpoints in Kubernetes](https://blog.cloud66.com/setting-up-secure-endpoints-in-kubernetes)
* [GKE Protecting cluster metadata](https://cloud.google.com/kubernetes-engine/docs/how-to/protecting-cluster-metadata)
* [Retrieving EC2 instance metadata](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instancedata-data-retrieval.html)
* [EC2 Instance user data](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-metadata.html)

### GUI elements restriction

Official documentation:

* [Deploy and Access the Kubernetes Dashboard](https://kubernetes.io/docs/tasks/access-application-cluster/web-ui-dashboard/)

Additional resources:

* [Dashboard Access control](https://github.com/kubernetes/dashboard/blob/master/docs/user/access-control/README.md)
* [Dashboard Creating sample user](https://github.com/kubernetes/dashboard/blob/master/docs/user/access-control/creating-sample-user.md)
* [On Securing the Kubernetes Dashboard](https://blog.heptio.com/on-securing-the-kubernetes-dashboard-16b09b1b7aca)

### Verify platform binaries before deploying

Additional resources:

* [Kubernetes platform binaries](https://github.com/kubernetes/kubernetes/releases)
