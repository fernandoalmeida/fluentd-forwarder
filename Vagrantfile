Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu-1310-x64-virtualbox-puppet"
  config.vm.box_url = "http://puppet-vagrant-boxes.puppetlabs.com/ubuntu-1310-x64-virtualbox-puppet.box"

  config.vm.hostname = "fluentd-forwarder"
  config.vm.network "public_network"
  config.vm.synced_folder "./", "/home/vagrant/fluentd-forwarder"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = 512
  end

  config.vm.provision :shell, :inline => <<-SH
    if [ $(grep -c "fluentd-aggregator" /etc/hosts) -eq 0 ]
    then
      echo "192.168.0.10 fluentd-aggregator" >> /etc/hosts
    fi
  SH

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "puppet/manifests"
    puppet.module_path = "puppet/modules"
    puppet.manifest_file = "init.pp"
    puppet.options = "--verbose"
  end
end
