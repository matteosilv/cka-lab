#!/bin/sh

set -e

# add kubernetes apt gpg key
curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | tee /etc/apt/sources.list.d/kubernetes.list

apt-get update
apt-get upgrade -y
apt-get install -y curl apt-transport-https vim git wget gnupg2 \
    software-properties-common apt-transport-https ca-certificates uidmap bash-completion

swapoff -a
modprobe overlay
modprobe br_netfilter
cat << EOF | tee /etc/sysctl.d/kubernetes.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
net.ipv4.ip_forward = 1
EOF
sysctl --system

apt-get install -y containerd kubeadm=1.24.1-00 kubelet=1.24.1-00 kubectl=1.24.1-00
apt-mark hold kubelet kubeadm kubectl

kubectl completion bash | tee /etc/bash_completion.d/kubectl > /dev/null

echo "10.0.0.10 k8scp" | tee --append /etc/hosts
