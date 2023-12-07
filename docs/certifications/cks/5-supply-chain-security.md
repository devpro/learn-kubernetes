# Supply chain security

## Content

### Base image

> Minimize base image footprint

Additional:

* [Overview of best practices for writing Dockerfiles](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/)
* [Kubernetes best practices: How and why to build small container images](https://cloud.google.com/blog/products/containers-kubernetes/kubernetes-best-practices-how-and-why-to-build-small-container-images) - February 28, 2023
* [Best practices for building containers by Google](https://cloud.google.com/architecture/best-practices-for-building-containers)
* [7 Google best practices for building containers by Google](https://cloud.google.com/blog/products/containers-kubernetes/7-best-practices-for-building-containers) - July 10, 2018
* ["Distroless" Container Images](https://github.com/GoogleContainerTools/distroless)
* [Multi-stage builds with Docker](https://docs.docker.com/build/building/multi-stage/)
* [Tips to Reduce Docker Image Sizes](https://hackernoon.com/tips-to-reduce-docker-image-sizes-876095da3b34) by HackerNoon - June 23, 2017
* [3 simple tricks for smaller Docker images](https://learnk8s.io/blog/smaller-docker-images) by learnk8s - April, 2019

### Securization

> Secure your supply chain: whitelist allowed registries, sign and validate images

✨ [Admission Controllers Reference > ImagePolicyWebhook](https://kubernetes.io/docs/reference/access-authn-authz/admission-controllers/#imagepolicywebhook), [Dynamic Admission Control](https://kubernetes.io/docs/reference/access-authn-authz/extensible-admission-controllers/), [A Guide to Kubernetes Admission Controllers](https://kubernetes.io/blog/2019/03/21/a-guide-to-kubernetes-admission-controllers/)

Additional:

* [Content trust in Docker](https://docs.docker.com/engine/security/trust/)
* [How to reject docker registries in Kubernetes?](https://stackoverflow.com/questions/54463125/how-to-reject-docker-registries-in-kubernetes)
* [Policy Primer via Examples](https://www.openpolicyagent.org/docs/latest/kubernetes-primer/)
* [Container Image Signatures in Kubernetes](https://medium.com/sse-blog/container-image-signatures-in-kubernetes-19264ac5d8ce) - August 7, 2020
* [kube-image-bouncer](https://github.com/flavio/kube-image-bouncer)

### Static analysis

> Use static analysis of user workloads (e.g.Kubernetes resources, Docker files)

🚀 [Trivy](tools/trivy.md)

Additional:

* [Clair](https://quay.github.io/clair/)
* [kube-hunter](https://github.com/aquasecurity/kube-hunter)
* [kube-score](https://kube-score.com/)
* [Kubesec](https://kubesec.io/)
* [Kubernetes static code analysis with Checkov](https://bridgecrew.io/blog/kubernetes-static-code-analysis-with-checkov/) - June 24, 2020

### Image scanning

> Scan images for known vulnerabilities

🚀 [Trivy](tools/trivy.md)
