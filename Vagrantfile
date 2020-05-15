$script = <<-'SCRIPT'
echo "provisioning the vm"
yum update -y
yum install -y telnet bash-completion wget curl vim ntp
swapoff -a
sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
systemctl restart sshd
systemctl enable ntp
systemctl start ntp
sed -i s/^SELINUX=.*$/SELINUX=disabled/ /etc/selinux/config
date > /etc/vagrant_provisioned_at
SCRIPT

Vagrant.configure("2") do |config|
config.vm.provision "shell", inline: $script
config.vm.synced_folder ".", "/home/vagrant/synced_folder", :mount_options => ["dmode=777", "fmode=666"]
#config.vm.synced_folder "/home/dk/Documents/git/kubespray", "/home/vagrant/local_git", :mount_options => ["dmode=777", "fmode=666"]
  config.vm.define "ansiblem" do |ansiblem|
    ansiblem.vm.box = "centos/7"
    ansiblem.vm.hostname = 'ansiblem'
    ansiblem.vm.network :private_network, ip: "192.168.10.30"
    ansiblem.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--memory", 4096]
      v.customize ["modifyvm", :id, "--cpus", 2]
      v.customize ["modifyvm", :id, "--name", "ansiblem"]
  end
end


  config.vm.define "ansibles1" do |ansibles1|
    ansibles1.vm.box = "centos/7"
    ansibles1.vm.hostname = 'ansibles1'
    ansibles1.vm.network :private_network, ip: "192.168.10.31"
    ansibles1.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--memory", 1024]
      v.customize ["modifyvm", :id, "--name", "ansibles1"]
    end
  end

  config.vm.define "ansibles2" do |ansibles2|
    ansibles2.vm.box = "centos/7"
    ansibles2.vm.hostname = 'ansibles2'
    ansibles2.vm.network :private_network, ip: "192.168.10.32"
    ansibles2.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--memory", 1024]
      v.customize ["modifyvm", :id, "--name", "ansibles2"]
    end
  end

  config.vm.define "ansibles3" do |ansibles3|
    ansibles3.vm.box = "centos/7"
    ansibles3.vm.hostname = 'ansibles3'
    ansibles3.vm.network :private_network, ip: "192.168.10.33"
    ansibles3.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--memory", 1024]
      v.customize ["modifyvm", :id, "--name", "ansibles3"]
    end
  end

end
