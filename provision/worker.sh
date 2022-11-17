#!/bin/sh

set -e

echo 'KUBELET_EXTRA_ARGS="--node-ip=192.168.56.3"' >> /etc/default/kubelet
sh /vagrant/.kubernetes/join.sh