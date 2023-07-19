#!/bin/sh

set -e

echo 'KUBELET_EXTRA_ARGS="--node-ip=10.0.0.14 --cgroup-driver=systemd"' >> /etc/default/kubelet
#sh /vagrant/.kubernetes/join-cp.sh
