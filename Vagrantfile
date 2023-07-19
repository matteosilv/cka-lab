Vagrant.configure("2") do |config|

  config.vm.define "haproxy" do |haproxy|
    haproxy.vm.box = "ubuntu/focal64"
    haproxy.vm.hostname = "haproxy"
    haproxy.vm.network :private_network, ip: "10.0.0.12"

    haproxy.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
      vb.cpus = "2"
      #vb.name = "control"
    end
  end

  config.vm.define "cp" do |cp|
    cp.vm.box = "ubuntu/focal64"
    cp.vm.hostname = "cp"
    cp.vm.network :private_network, ip: "10.0.0.10"

    cp.vm.provider "virtualbox" do |vb|
      vb.memory = "4096"
      vb.cpus = "3"
      #vb.name = "control"
    end

    cp.vm.provision "shell", path: "provision/common.sh"
    cp.vm.provision "shell", path: "provision/cp.sh"
    cp.vm.provision "shell", path: "provision/kubeconfig.sh", privileged: false
  end

  config.vm.define "cp2" do |cp2|
    cp2.vm.box = "ubuntu/focal64"
    cp2.vm.hostname = "cp2"
    cp2.vm.network :private_network, ip: "10.0.0.13"

    cp2.vm.provider "virtualbox" do |vb|
      vb.memory = "4096"
      vb.cpus = "2"
      #vb.name = "control"
    end

    cp2.vm.provision "shell", path: "provision/common.sh"
    cp2.vm.provision "shell", path: "provision/cp2.sh"
    cp2.vm.provision "shell", path: "provision/kubeconfig.sh", privileged: false
  end

  config.vm.define "cp3" do |cp3|
    cp3.vm.box = "ubuntu/focal64"
    cp3.vm.hostname = "cp3"
    cp3.vm.network :private_network, ip: "10.0.0.14"

    cp3.vm.provider "virtualbox" do |vb|
      vb.memory = "4096"
      vb.cpus = "2"
      #vb.name = "control"
    end

    cp3.vm.provision "shell", path: "provision/common.sh"
    cp3.vm.provision "shell", path: "provision/cp3.sh"
    cp3.vm.provision "shell", path: "provision/kubeconfig.sh", privileged: false
  end

  config.vm.define "worker" do |worker|
    worker.vm.box = "ubuntu/focal64"
    worker.vm.hostname = "worker"
    worker.vm.network :private_network, ip: "10.0.0.11"

    worker.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
      vb.cpus = "1"
      #vb.name = "worker"
    end

    worker.vm.provision "shell", path: "provision/common.sh"
    worker.vm.provision "shell", path: "provision/worker.sh"
    worker.vm.provision "shell", path: "provision/kubeconfig.sh", privileged: false
  end
end