# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

# Make sure we have the vagrant-hostmanager plugin. No point in going forward with out it.
if !(Vagrant.has_plugin?('vagrant-hostmanager'))
    fail_with_message "vagrant-hostmanager missing, please install the plugin with this command:\nvagrant plugin install vagrant-hostmanager\n"
end

require "json"

# Load in external config
config_file = "#{File.dirname(__FILE__)}/vagrant.json"
vm_ext_conf = JSON.parse(File.read(config_file))

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "boxcutter/ubuntu1604"
  config.vm.box_version = "2.0.18"

  config.vm.provider "vmware_fusion" do |v|
    v.vmx["memsize"] = vm_ext_conf["memory"]
    v.vmx["numvcpus"] = vm_ext_conf["cpus"]
  end

  config.vm.provider "virtualbox" do |v|

    # Memory and CPU.
    v.memory = vm_ext_conf["memory"]
    v.cpus = vm_ext_conf["cpus"]

    # Make VirtualBox work like VMware and use the host's resolving as a DNS proxy in NAT mode
    # https://www.virtualbox.org/manual/ch09.html#nat_host_resolver_proxy
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on" ]

  end

  # Create a private network, which allows host-only access to the machine
    # using a specific IP.
    config.vm.network "private_network", type: "dhcp"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # define the hostname
  config.vm.hostname = vm_ext_conf["hostname"]

  # Setup hostmanager plugin.
  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true
  config.hostmanager.manage_guest = true
  config.hostmanager.aliases = %W(#{vm_ext_conf['hostAliases']})

  # Dynamically determine the IP address of the VM.
  config.hostmanager.ip_resolver = proc do |vm, resolving_vm|
    ip = ""
    if hostname = (vm.ssh_info && vm.ssh_info[:host])
      vm.communicate.execute("/bin/hostname -I | cut -d ' ' -f 2") do |type, contents|
        ip = contents.split()[0]
      end
    end
    ip
  end

  # If true, then any SSH connections made will enable agent forwarding.
  config.ssh.forward_agent = true

  # Share the folder between host and VM
  config.vm.synced_folder ".", "/vagrant"
  # config.vm.synced_folder ".", "/vagrant", type: 'nfs'

  # Provision with shell, nice and simple :)
  # Fixes "stdin: is not a tty" and "mesg: ttyname failed : Inappropriate ioctl for device" messages --> mitchellh/vagrant#1673
  config.vm.provision :shell , inline: "(grep -q 'mesg n' /root/.profile && sed -i '/mesg n/d' /root/.profile && echo 'Ignore the previous error, fixing this now...') || exit 0;"

  # configuration step 1: set timezone
  config.vm.provision "shell", path: "vagrant/timezone.sh", args: "#{vm_ext_conf['timezone']}"

  # configuration step 2: apt-get
  config.vm.provision "shell", path: "vagrant/apt-get.sh"

  # configuration step 3: git
  config.vm.provision "shell", path: "vagrant/git.sh"

  # configuration step 4: nodejs
  config.vm.provision "shell", path: "vagrant/nodejs.sh"

  # configuration step 5: clean (remove unccessary data and GBs)
  config.vm.provision "shell", path: "vagrant/clean.sh"

end
