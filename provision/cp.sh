#!/bin/sh

set -e
rm -rf /vagrant/.kubernetes
mkdir /vagrant/.kubernetes
echo 'KUBELET_EXTRA_ARGS="--node-ip=10.0.0.10 --cgroup-driver=systemd"' >> /etc/default/kubelet
kubeadm init --config=/vagrant/config/kubeadm-config.yaml --upload-certs
KUBECONFIG=/etc/kubernetes/admin.conf kubectl apply -f https://raw.githubusercontent.com/projectcalico/calico/v3.25.0/manifests/calico.yaml
kubeadm token create --print-join-command > /vagrant/.kubernetes/join.sh
cp /etc/kubernetes/admin.conf /vagrant/.kubernetes/config
