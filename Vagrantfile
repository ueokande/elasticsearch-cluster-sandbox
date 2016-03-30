# -*- mode: ruby -*-
# vi: set ft=ruby :

vms = [
  {
    :name => :shibuya,
    :ip   => "192.168.0.101",
    :port => "9201"
  },
  {
    :name => :ebisu,
    :ip   => "192.168.0.102",
    :port => "9202"
  },
  {
    :name => :meguro,
    :ip   => "192.168.0.103",
    :port => "9203"
  },
  {
    :name => :gotanda,
    :ip   => "192.168.0.104",
    :port => "9204"
  }
]

Vagrant.configure(2) do |config|
  config.vm.box = "puppetlabs/centos-7.2-64-nocm"

  vms.each do |opts|
    config.vm.define :"#{opts[:name]}" do |config|
      config.vm.hostname = "#{opts[:name]}.elasticsearch.example"
      config.vm.synced_folder ".", "/vagrant"
      config.vm.network :private_network, ip: "#{opts[:ip]}"
      config.vm.network :forwarded_port, guest: 9200, host: "#{opts[:port]}"
    end
  end

end
