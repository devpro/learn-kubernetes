# AppArmor

> AppArmor is a Linux kernel security module that supplements the standard Linux user and group based permissions to confine programs to a limited set of resources. AppArmor can be configured for any application to reduce its potential attack surface and provide greater in-depth defense. It is configured through profiles tuned to allow the access needed by a specific program or container, such as Linux capabilities, network access, file permissions, etc. Each profile can be run in either _enforcing_ mode, which blocks access to disallowed resources, or _complain_ mode, which only reports violations.
> 
> &mdash; <cite>[kubernetes.io/docs/tutorials/security/apparmor](https://kubernetes.io/docs/tutorials/security/apparmor/)</cite>

✨ [AppArmor documentation](https://gitlab.com/apparmor/apparmor/-/wikis/Documentation)

🌐 [apparmor.net](https://www.apparmor.net/)

## Quick start

Profiles can be stored in files on the disk and must be enabled on all servers running the workload (or the Pod won't be able to start).

Example of a profile preventing the program from writing any data to the disk:

```ini
#include <tunables/global>
profile k8s-deny-write flags=(attach_disconnected) {
    #include <abstractions/base>
    file,
    # Deny all file writes.
    deny /** w,
}
```

Example of a command line to apply the profile (use "-C" flag for complain mode):

```bash
sudo apparmor_parser /path/to/file
```

Example of Pod definition using the profile:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: test-pod
  annotations:
    container.apparmor.security.beta.kubernetes.io/password-db: localhost/k8s-deny-write
spec:
  containers:
    - name: password-db
      image: radial/busyboxplus:curl
      command: ['sh', '-c', 'while true; do if echo "The password is hunter2" > password.txt; then echo "Password hunter2 logged."; else echo "Password log attempt blocked."; fi; sleep 5; done']
```

Example of a command line to see if the file has been written:

```bash
kubectl exec test-pod -n demo -- cat password.txt
```

In this example, the profile won't be loaded after a server reboot. The file must be copied to `/etc/apparmor.d` directory and its file owner/permission changed accordingly.

## Commands

```bash
# gives a high level status of AppArmor and applications it has profiles for
sudo aa-status

# discovers network servers that may or may not be confined
sudo aa-unconfined

# parses a file
sudo apparmor_parser /path/to/file

# gives a status
sudo apparmor_status
```

## Directories

* `/etc/apparmor/` contains global and system settings
* `/etc/apparmor.d/` contains all the profiles, as well as profile 'chunks' that are commonly shared between profiles, that AppArmor will load on next boot
