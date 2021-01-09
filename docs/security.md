# Security in Kubernetes

## Authentication

Two types of accounts:

- Users through the kube-apiserver
  - Authentication mechanism
    - static password files: kube-apiserver `--basic-auth-file` start argument (csv file)
    - static token files: kube-apiserver `--token-auth-file` start argument (csv file)
    - certificates
    - identity services
- Service Accounts

## Certificates

```bash
# view a certificate
openssl x509 -in <certificate path> -text

# for example to view the Common Name (CN) configured on the Kube API Server Certificate
openssl x509 -in /etc/kubernetes/pki/apiserver.crt -text -noout
```

Certificates folders: /etc/kubernetes/pki (control plane), /var/lib/kubelet/pki (workder node)

## Roles

```bash
# check if a user can do actions
k get pods --as dev-user
```
