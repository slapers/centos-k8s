# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

    config.vm.box = "centos/7"

    config.vm.define "master1" do |node|
        diskfile = "./tmp/master1.vdi"
        node.vm.box = "centos/7"
        node.vm.hostname = "master1.k8s.lapers.be"
        node.vm.network "private_network", ip: "172.16.0.10"
        node.vm.network :forwarded_port, guest: 22, host: 22222
        node.vm.network :forwarded_port, guest: 443, host: 8443

        node.vm.provider "virtualbox" do |v|
            v.memory = 1536
            v.linked_clone = true

            unless File.exist?(diskfile)
                v.customize ['createhd', '--filename', diskfile, '--size', 40 * 1024]
            end
            v.customize ['storageattach', :id, '--storagectl', 'IDE Controller', '--port', 1, '--device', 0, '--type', 'hdd', '--medium', diskfile]
        end

        node.vm.provision :shell, :inline => "sudo bash /home/vagrant/sync/vagrant/inject-ssh-keys.sh -k 'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAvg0TbM+cz3wEf4hfNm+wMUuLe9X0Z21yG0/4Ha47kN7x7lDYfsnmSD2YdSruSdcZSSKRWDkX96bXPVVL//Awi/HzzVExucRej4HlETqvOGIMeaMZwQM/80+/vMGOphGehU1FMRdwuLVbvx/eajsaYRBwUrrt4ngsCH3Tfd6kbGu+cGYkfa8mJyxWXKfke1kcnYRa0LQSznym67l+6MHfyFDhsXhsoRq6GvF4sS4MocyeaSRidhStJMWmEhGgl52owvaQMRd1sBqXgiKkLyhvVPJqBypEfvXcLi9tScCPaxN0n0lqEQPbdz9xfz6qdTi2b4rvaogCOEvdxaDf7Ok3ow== stefan@rackboost.com'"
    end

    config.vm.define "node1" do |node|
        diskfile = "./tmp/node1.vdi"
        node.vm.box = "centos/7"
        node.vm.hostname = "node1.k8s.lapers.be"
        node.vm.network "private_network", ip: "172.16.0.21"
        node.vm.network :forwarded_port, guest: 22, host: 22223

        node.vm.provider "virtualbox" do |v|
            v.memory = 1536
            v.linked_clone = true

            unless File.exist?(diskfile)
                v.customize ['createhd', '--filename', diskfile, '--size', 40 * 1024]
            end
            v.customize ['storageattach', :id, '--storagectl', 'IDE Controller', '--port', 1, '--device', 0, '--type', 'hdd', '--medium', diskfile]
        end

        node.vm.provision :shell, :inline => "sudo bash /home/vagrant/sync/vagrant/inject-ssh-keys.sh -k 'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAvg0TbM+cz3wEf4hfNm+wMUuLe9X0Z21yG0/4Ha47kN7x7lDYfsnmSD2YdSruSdcZSSKRWDkX96bXPVVL//Awi/HzzVExucRej4HlETqvOGIMeaMZwQM/80+/vMGOphGehU1FMRdwuLVbvx/eajsaYRBwUrrt4ngsCH3Tfd6kbGu+cGYkfa8mJyxWXKfke1kcnYRa0LQSznym67l+6MHfyFDhsXhsoRq6GvF4sS4MocyeaSRidhStJMWmEhGgl52owvaQMRd1sBqXgiKkLyhvVPJqBypEfvXcLi9tScCPaxN0n0lqEQPbdz9xfz6qdTi2b4rvaogCOEvdxaDf7Ok3ow== stefan@rackboost.com'"
    end

    config.vm.define "node2" do |node|
        diskfile = "./tmp/node2.vdi"
        node.vm.box = "centos/7"
        node.vm.hostname = "node2.k8s.lapers.be"
        node.vm.network "private_network", ip: "172.16.0.22"
        node.vm.network :forwarded_port, guest: 22, host: 22224

        node.vm.provider "virtualbox" do |v|
            v.memory = 1536
            v.linked_clone = true

            unless File.exist?(diskfile)
                v.customize ['createhd', '--filename', diskfile, '--size', 40 * 1024]
            end
            v.customize ['storageattach', :id, '--storagectl', 'IDE Controller', '--port', 1, '--device', 0, '--type', 'hdd', '--medium', diskfile]
        end

        node.vm.provision :shell, :inline => "sudo bash /home/vagrant/sync/vagrant/inject-ssh-keys.sh -k 'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAvg0TbM+cz3wEf4hfNm+wMUuLe9X0Z21yG0/4Ha47kN7x7lDYfsnmSD2YdSruSdcZSSKRWDkX96bXPVVL//Awi/HzzVExucRej4HlETqvOGIMeaMZwQM/80+/vMGOphGehU1FMRdwuLVbvx/eajsaYRBwUrrt4ngsCH3Tfd6kbGu+cGYkfa8mJyxWXKfke1kcnYRa0LQSznym67l+6MHfyFDhsXhsoRq6GvF4sS4MocyeaSRidhStJMWmEhGgl52owvaQMRd1sBqXgiKkLyhvVPJqBypEfvXcLi9tScCPaxN0n0lqEQPbdz9xfz6qdTi2b4rvaogCOEvdxaDf7Ok3ow== stefan@rackboost.com'"
    end
end
