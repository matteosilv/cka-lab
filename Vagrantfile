Vagrant.configure("2") do |config|
  config.vm.define "cp" do |control|
    control.vm.box = "ubuntu/focal64"
    control.vm.hostname = "cp"
    control.vm.network :private_network, ip: "10.0.0.10"

    config.vm.provider "virtualbox" do |vb|
      vb.memory = "2048"
      vb.cpus = "2"
      #vb.name = "control"
    end

    control.vm.network "forwarded_port", guest: 6443, host: 6443

    control.vm.provision "shell", path: "provision/common.sh"
    control.vm.provision "shell", path: "provision/cp.sh"
    control.vm.provision "shell", path: "provision/kubeconfig.sh", privileged: false
  end

  config.vm.define "worker" do |worker|
    worker.vm.box = "ubuntu/focal64"
    worker.vm.hostname = "worker"
    worker.vm.network :private_network, ip: "10.0.0.11"

    worker.vm.provider "virtualbox" do |vb|
      vb.memory = "2048"
      vb.cpus = "2"
      #vb.name = "worker"
    end

    worker.vm.provision "shell", path: "provision/common.sh"
    worker.vm.provision "shell", path: "provision/worker.sh"
    worker.vm.provision "shell", path: "provision/kubeconfig.sh", privileged: false
  end
end