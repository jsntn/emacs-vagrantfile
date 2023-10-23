Vagrant.configure("2") do |config|
  config.vm.box = "archlinux/archlinux"
  config.ssh.insert_key = false
  config.vm.provision :shell, :path => "deploy/bootstrap.sh"
end
