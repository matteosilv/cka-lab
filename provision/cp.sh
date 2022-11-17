#!/bin/sh

set -e
rm -rf /vagrant/.kubernetes
mkdir /vagrant/.kubernetes
echo 'KUBELET_EXTRA_ARGS="--node-ip=192.168.56.2"' >> /etc/default/kubelet
kubeadm init --config=/vagrant/config/kubeadm-config.yaml --upload-certs
KUBECONFIG=/etc/kubernetes/admin.conf kubectl apply -f /vagrant/config/calico.yaml
kubeadm token create --print-join-command > /vagrant/.kubernetes/join.sh
cp /etc/kubernetes/admin.conf /vagrant/.kubernetes/config
