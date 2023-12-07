# gVisor

> **gVisor** is an open-source Linux-compatible sandbox that runs anywhere existing container tooling does. It enables cloud-native container security and portability.
>
> &mdash; <cite>[gvisor.dev](https://gvisor.dev/)</cite>

🌐 [docs](https://gvisor.dev/docs/), [code](https://github.com/google/gvisor)

![](https://miro.medium.com/v2/resize:fit:640/format:webp/1*MMeK2KHQM3bKGz-zKdf1cw.png)

## Gettings started

* [Kubernetes Quick Start](https://gvisor.dev/docs/user_guide/quick_start/kubernetes/)
* [How to Implement Secure Containers Using Google’s gVisor](https://thenewstack.io/how-to-implement-secure-containers-using-googles-gvisor/) - December 19, 2018

## runcs

**gVisor** includes an [Open Container Initiative (OCI)](https://www.opencontainers.org/) runtime called **runsc** that makes it easy to work with existing container tooling.

The **runsc** runtime integrates with Docker and Kubernetes, making it simple to run sandboxed containers.
