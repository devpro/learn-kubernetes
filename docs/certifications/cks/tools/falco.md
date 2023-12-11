# Falco

> **Falco** is a cloud-native security tool designed for Linux systems. It employs custom rules on kernel events, which are enriched with container and Kubernetes metadata, to provide real-time alerts.  
>
> **Falco** helps you gain visibility into abnormal behavior, potential security threats, and compliance violations, contributing to comprehensive runtime security.  
>
> &mdash; <cite>[falco.org](https://falco.org/)</cite>

✨ [docs](https://falco.org/docs/)

🌐 [code](https://github.com/falcosecurity/falco), [sysdig.com/opensource/falco](https://sysdig.com/opensource/falco/)

![](https://falco.org/docs/getting-started/images/falco-architecture-v2.png)

## Default configuration

✨ [Default and Local Rules Files](https://falco.org/docs/rules/default-custom/), [Default Rules](https://falco.org/docs/reference/rules/default-rules/)

`/etc/falco/falco.yaml` is the default configuration file.

It makes Falco load rules from the `/etc/falco/falco_rules.yaml` file followed by any custom rules located in the `/etc/falco/rules.d` directory. This configuration is governed by the `rules_file` key:

```yaml
rules_file:
  - /etc/falco/falco_rules.yaml
  - /etc/falco/falco_rules.local.yaml
  - /etc/falco/rules.d
```

## Releases

Version  | Date           | Links
---------|----------------|--------------------------------------------------------------
**0.15** | May 13th, 2019 | [sysdig blog](https://sysdig.com/blog/falco-0-15-0-released/)

## Getting started

* [Self-paced online resources](https://falco.org/training/)
* [Sysdig - Runtime security](https://sysdig.com/blog/intro-runtime-security-falco/) - November 15, 2021
* [Sysdig - Audit logs](https://sysdig.com/blog/kubernetes-audit-log-falco/) - February 9, 2021
* [KubeCon 2020 - Intro to Falco: Intrusion Detection for Containers](https://www.youtube.com/watch?v=rBqBrYESryY) - Sep 4, 2020
* [CNCF Webinar w/ slides - Getting started with container runtime security using Falco](https://www.cncf.io/online-programs/getting-started-with-container-runtime-security-using-falco/) - September 2, 2020
* [Kubernetes Security monitoring at scale with Sysdig Falco, by Skyscanner Engineering](https://medium.com/@SkyscannerEng/kubernetes-security-monitoring-at-scale-with-sysdig-falco-a60cfdb0f67a) - January 29, 2020

## Recipes

* [Cloud Infrastructure Entitlements Management (CIEM) with Sysdig Secure](https://sysdig.com/blog/ciem-security-sysdig-secure/) - October 27, 2021
* [Using Falco to monitor outbound traffic for Pods in Kubernetes](https://www.rkatz.xyz/post/2021-04-16-falco-network-monitoring/) by The Katz Experiments - April 16, 2021
* [How to detect Kubernetes vulnerability CVE-2019-11246 using Falco](https://sysdig.com/blog/how-to-detect-kubernetes-vulnerability-cve-2019-11246-using-falco/) - July 9, 2019
