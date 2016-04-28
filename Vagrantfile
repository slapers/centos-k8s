# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

    config.vm.box = "centos/7"

    config.vm.define "master1" do |node|
        node.vm.box = "centos/7"
        node.vm.hostname = "master1.k8s.lapers.be"
        node.vm.network "private_network", ip: "172.16.0.10"
        node.vm.network :forwarded_port, guest: 22, host: 22222
        node.vm.network :forwarded_port, guest: 443, host: 8443

        node.vm.provider "virtualbox" do |v|
            v.memory = 512
            v.linked_clone = true
        end

        node.vm.provision :shell, :inline => "sudo bash /home/vagrant/sync/vagrant/inject-ssh-keys.sh -k 'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAvg0TbM+cz3wEf4hfNm+wMUuLe9X0Z21yG0/4Ha47kN7x7lDYfsnmSD2YdSruSdcZSSKRWDkX96bXPVVL//Awi/HzzVExucRej4HlETqvOGIMeaMZwQM/80+/vMGOphGehU1FMRdwuLVbvx/eajsaYRBwUrrt4ngsCH3Tfd6kbGu+cGYkfa8mJyxWXKfke1kcnYRa0LQSznym67l+6MHfyFDhsXhsoRq6GvF4sS4MocyeaSRidhStJMWmEhGgl52owvaQMRd1sBqXgiKkLyhvVPJqBypEfvXcLi9tScCPaxN0n0lqEQPbdz9xfz6qdTi2b4rvaogCOEvdxaDf7Ok3ow== stefan@rackboost.com'"
    end

    config.vm.define "node1" do |node|
        node.vm.box = "centos/7"
        node.vm.hostname = "node1.k8s.lapers.be"
        node.vm.network "private_network", ip: "172.16.0.21"
        node.vm.network :forwarded_port, guest: 22, host: 22223

        node.vm.provider "virtualbox" do |v|
            v.memory = 512
            v.linked_clone = true
        end

        node.vm.provision :shell, :inline => "sudo bash /home/vagrant/sync/vagrant/inject-ssh-keys.sh -k 'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAvg0TbM+cz3wEf4hfNm+wMUuLe9X0Z21yG0/4Ha47kN7x7lDYfsnmSD2YdSruSdcZSSKRWDkX96bXPVVL//Awi/HzzVExucRej4HlETqvOGIMeaMZwQM/80+/vMGOphGehU1FMRdwuLVbvx/eajsaYRBwUrrt4ngsCH3Tfd6kbGu+cGYkfa8mJyxWXKfke1kcnYRa0LQSznym67l+6MHfyFDhsXhsoRq6GvF4sS4MocyeaSRidhStJMWmEhGgl52owvaQMRd1sBqXgiKkLyhvVPJqBypEfvXcLi9tScCPaxN0n0lqEQPbdz9xfz6qdTi2b4rvaogCOEvdxaDf7Ok3ow== stefan@rackboost.com'"
    end

    config.vm.define "node2" do |node|
        node.vm.box = "centos/7"
        node.vm.hostname = "node2.k8s.lapers.be"
        node.vm.network "private_network", ip: "172.16.0.22"
        node.vm.network :forwarded_port, guest: 22, host: 22224

        node.vm.provider "virtualbox" do |v|
            v.memory = 512
            v.linked_clone = true
        end

        node.vm.provision :shell, :inline => "sudo bash /home/vagrant/sync/vagrant/inject-ssh-keys.sh -k 'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAvg0TbM+cz3wEf4hfNm+wMUuLe9X0Z21yG0/4Ha47kN7x7lDYfsnmSD2YdSruSdcZSSKRWDkX96bXPVVL//Awi/HzzVExucRej4HlETqvOGIMeaMZwQM/80+/vMGOphGehU1FMRdwuLVbvx/eajsaYRBwUrrt4ngsCH3Tfd6kbGu+cGYkfa8mJyxWXKfke1kcnYRa0LQSznym67l+6MHfyFDhsXhsoRq6GvF4sS4MocyeaSRidhStJMWmEhGgl52owvaQMRd1sBqXgiKkLyhvVPJqBypEfvXcLi9tScCPaxN0n0lqEQPbdz9xfz6qdTi2b4rvaogCOEvdxaDf7Ok3ow== stefan@rackboost.com'"
    end





  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   sudo apt-get update
  #   sudo apt-get install -y apache2
  # SHELL
end
