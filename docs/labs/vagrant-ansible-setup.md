# HOWTO Setup Kubernetes Using Ansible and Vagrant

This tutorial originates from [kubernetes.io/blog](https://kubernetes.io/blog/2019/03/15/kubernetes-setup-using-ansible-and-vagrant/) (March 15, 2019). It has been updated and validated against Windows 10 / WSL2 / Ubuntu 20.04 on December 2021.

## Requirements

* Linux (can run with WSL)
* VirtualBox
* Vagrant (see [GitHub Issue#291](https://github.com/geerlingguy/ansible-for-devops/issues/291#issuecomment-815253528) to make it work in WSL)
* Ansible

## Design

* Vagrant will create at least two machines with [samples/k8s-ansible-vagrant/Vagrantfile](../../samples/k8s-ansible-vagrant/Vagrantfile)
* Vagrant will configure the machines with Ansible with two types of playbooks:
  * [samples/k8s-ansible-vagrant/ansible/playbooks/controleplane.yml](../../samples/k8s-ansible-vagrant/ansible/playbooks/controleplane.yml)
  * [samples/k8s-ansible-vagrant/ansible/playbooks/worker.yml](../../samples/k8s-ansible-vagrant/ansible/playbooks/worker.yml)
* Ansible playbook for the control plane has been updated to use Calico (see [Quickstart for Calico on Kubernetes](https://projectcalico.docs.tigera.io/getting-started/kubernetes/quickstart))

## Configuration

* Review and update if needed [samples/k8s-ansible-vagrant/Vagrantfile](../../samples/k8s-ansible-vagrant/Vagrantfile)
  * OS images
  * Number of nodes
  * IP ranges (in this case do a search & replace also in [samples/k8s-ansible-vagrant/ansible/playbooks/master.yml](../../samples/k8s-ansible-vagrant/ansible/playbooks/master.yml))

## Steps

```bash
cd samples/k8s-ansible-vagrant

# provisions and configure the machines
vagrant up

# connects to k8s control plane
vagrant ssh k8s-controleplane

# on the machine, look at nodes state (should be Ready)
$ kubectl get nodes

# connects to k8s first node
vagrant ssh node-1

# (optional) troubleshoots
vagrant up --provision k8s-controleplane

# cleans-up
vagrant destroy
```
