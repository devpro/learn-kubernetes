# Condensed Kubernetes

This is a training material to get knowledge about Kubernetes and prepare for Kubernetes certifications (CKA & CKAD). It has been initiated in 2020.

## Content

* [Basics](./docs/basics.md)
* [Kubectl](./docs/tools/kubectl.md)
* [Installation](./docs/installation.md)
* [Projects](./docs/projects.md)
* [Releases](./docs/releases.md)
* Labs:
  * [Odroid setup](./docs/odroid-setup.md)
  * [LF - Kubernetes for Developers](./docs/labs-lfd259.md)
  * [LF - Kubernetes Fundamentals](./docs/labs-lfs258.md)
* [Examination](./docs/examination.md)

## Sandboxes

* [Katacoda](https://www.katacoda.com/)
  * [Kubernetes Playground](https://www.katacoda.com/courses/kubernetes/playground) (use `Shift+Inser` to paste from the clipboard in the web page interactive console)
  * [Lab Courses](https://www.katacoda.com/learn)
* [Play with Kubernetes](https://labs.play-with-k8s.com/)

## References

### Certifications

Programs:

* [Certified Kubernetes Application Developer (CKAD)](https://www.cncf.io/certification/ckad/)

<details>
  <summary>CKAD domains with their weights</summary>

  * Core Concepts 13%
  * Configuration 18%
  * Multi-Container Pods 10%
  * Observability 18%
  * Pod Design 20%
  * Services & Networking 13%
  * State Persistence 8%

</details>

* [Certified Kubernetes Administrator (CKA)](https://www.cncf.io/certification/cka/)

<details>
  <summary>CKA domains with their weights</summary>

  * Application Lifecycle Management 8%
  * Installation, Configuration & Validation 12%
  * Core Concepts 19%
  * Networking 11%
  * Scheduling 5%
  * Security 12%
  * Cluster Maintenance 11%
  * Logging / Monitoring 5%
  * Storage 7%
  * Troubleshooting 10%
</details>

General information:

* [Candidate handbook](https://docs.linuxfoundation.org/tc-docs/certification/lf-candidate-handbook)
* [Curriculum](https://github.com/cncf/curriculum)
* [Tips](https://docs.linuxfoundation.org/tc-docs/certification/tips-cka-and-ckad)

### Training courses

* Free
  * [Linux Foundation - Introduction to Kubernetes (LFS158)](https://training.linuxfoundation.org/training/introduction-to-kubernetes/)
  * [Microsoft - Kubernetes learning path](https://azure.microsoft.com/en-us/resources/kubernetes-learning-path/)
  * [Coursera - Getting Started with Google Kubernetes Engine](https://www.coursera.org/learn/google-kubernetes-engine)
  * [VMWare - KubeAcademy](https://kube.academy/)
  * [Collabnix - An Ultimate Kubernetes Hands-on Labs](https://collabnix.github.io/kubelabs/) ([collabnix/kubelabs](https://github.com/collabnix/kubelabs))
* Charged
  * [Linux Foundation - Kubernetes Fundamentals (LFS258)](https://trainingportal.linuxfoundation.org/learn/course/kubernetes-fundamentals-lfs258/course-introduction/course-information) > [Class forum](https://forum.linuxfoundation.org/categories/lfs258-class-forum)
  * [Linux Foundation - Kubernetes for Developers (LFD259)](https://trainingportal.linuxfoundation.org/learn/course/kubernetes-for-developers-lfd259/introduction/course-information) > [Class forum](https://forum.linuxfoundation.org/categories/lfd259-class-forum)

### Cloud Native Computing Foundation (CNCF)

* [cncf.io](https://www.cncf.io/) ([Youtube channel](https://www.youtube.com/channel/UCvqbFHwN-nwalWPjPUKpvTA))
  * [Annoucements](https://www.cncf.io/newsroom/announcements/)
  * [Landscape](https://landscape.cncf.io/zoom=200)
    * [Introducing The Cloud Native Landscape 2.0](https://www.cncf.io/blog/2018/03/08/introducing-the-cloud-native-landscape-2-0-interactive-edition/) - March 8, 2018

### Webinars

<details>
  <summary>CNCF webinars</summary>

  * [K8s audit logging deep dive](https://www.cncf.io/webinars/k8s-audit-logging-deep-dive/) - October 22, 2020
  * [Deploying Kubernetes to bare metal using cluster API](https://www.cncf.io/webinars/deploying-kubernetes-to-bare-metal-using-cluster-api/) - October 21, 2020
  * [The abc’s of Kubernetes security](https://www.cncf.io/webinars/the-abcs-of-kubernetes-security/) - October 21, 2020
  * [Building a Cloud-Native Technology Stack That Supports Full Cycle Development ](https://www.cncf.io/webinars/building-a-cloud-native-technology-stack-that-supports-full-cycle-development/) - September 9, 2020
  * [Arm Developer Experience Spanning Cloud, 5G and IoT](https://www.cncf.io/webinars/arm-developer-experience-spanning-cloud-5g-and-iot/) - September 8, 2020
  * [Running the next generation of cloud-native applications using Open Application Model (OAM)](https://www.cncf.io/webinars/running-the-next-generation-of-cloud-native-applications-using-open-application-model-oam/) - September 3, 2020
  * [Getting started with container runtime security using Falco](https://www.cncf.io/webinars/getting-started-with-container-runtime-security-using-falco/) - September 2, 2020
  * [Let’s untangle The Service Mesh](https://www.cncf.io/webinars/lets-untangle-the-service-mesh/) - September 1, 2020
  * [Local development in the age of Kubernetes](https://www.cncf.io/webinars/local-development-in-the-age-of-kubernetes/) - August 26, 2020
  * [Modern Software Development Pipeline: A Security Reference Architecture](https://www.cncf.io/webinars/modern-software-development-pipeline-a-security-reference-architecture/) - August 25, 2020
  * [Highly Scalable SaaS Apps on Kubernetes: Real Life Case Studies](https://www.cncf.io/webinars/highly-scalable-saas-apps-on-kubernetes-real-life-case-studies/) - September 9, 2020
  * [Comparing eBPF and Istio/Envoy for Monitoring Microservice Interactions](https://www.cncf.io/webinars/comparing-ebpf-and-istio-envoy-for-monitoring-microservice-interactions/) - August 4, 2020
  * [Event-Driven Cloud Native Workflows Use Cases and Patterns](https://www.cncf.io/webinars/event-driven-cloud-native-workflows-use-cases-and-patterns/) - July 29, 2020
  * [CNCF Member Webinar: Kubernetes Policies 101](https://www.cncf.io/webinars/kubernetes-policies-101/) - July 28, 2020
  * [The top 7 most useful Kubernetes APIs for comprehensive cloud native observability](https://www.cncf.io/webinars/the-top-7-most-useful-kubernetes-apis-for-comprehensive-cloud-native-observability/) - July 9, 2020
  * [Building Production-ready Services with Kubernetes and Serverless Architectures](https://www.cncf.io/webinars/building-production-ready-services-with-kubernetes-and-serverless-architectures/) - July 8, 2020
  * [Optimize your Kubernetes Clusters on Azure with Built-in Best Practices](https://www.cncf.io/webinars/optimize-your-kubernetes-clusters-on-azure-with-built-in-best-practices/) - July 7, 2020
  * [Best Practices for Running and Implementing Kubernetes](https://www.cncf.io/webinars/best-practices-for-running-and-implementing-kubernetes/) - June 30, 2020
  * [How Alibaba Extends K8s scheduler to support AI and big data workloads](https://www.cncf.io/webinars/how-alibaba-extends-k8s-scheduler-to-support-ai-and-big-data-workloads/) - July 15, 2020
  * [Kubernetes for storage, an overview](https://www.cncf.io/webinars/kubernetes-for-storage-an-overview/) - July 16, 2020
  * [Implementing Canary Releases on Kubernetes w/ Spinnaker, Istio, and Prometheus](https://www.cncf.io/webinars/implementing-canary-releases-on-kubernetes-w-spinnaker-istio-and-prometheus/) - July 22, 2020
  * [Kubernetes Secrets Management: Build Secure Apps Faster Without Secrets](https://www.cncf.io/webinars/kubernetes-secrets-management-build-secure-apps-faster-without-secrets/) - July 22, 2020
  * [Building application management platform with Open Application Model](https://www.cncf.io/webinars/cncf-ambassador-webinar-building-application-management-platform-with-open-application-model/) - July 22, 2020
  * [Observability of multi-party computation with OpenTelemetry](https://www.cncf.io/webinars/observability-of-multi-party-computation-with-opentelemetry/) - July 23, 2020
  
</details>

### Podcasts

* [Kubernetes Podcast from Google](https://kubernetespodcast.com/)

### Books

* [O'Reilly - Cloud Native DevOps with Kubernetes](https://www.oreilly.com/library/view/cloud-native-devops/9781492040750/)
* [O'Reilly - Kubernetes Up and Running](https://www.oreilly.com/library/view/kubernetes-up-and/9781491935668/)
