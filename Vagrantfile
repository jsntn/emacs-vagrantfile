Vagrant.configure("2") do |config|
  # config.vm.box = "ubuntu/focal64" # Ubuntu 20.04
  config.vm.box = "hashicorp/bionic64" # Ubuntu 18.04
  config.ssh.insert_key = false

  # https://stackoverflow.com/questions/45841206/how-to-enable-password-ssh-authentication-for-vagrant-vm
  # config.vm.provision "shell", inline: <<-'SHELL'
  # pwd
  # SHELL
  config.vm.provision :shell, :path => "deploy/bootstrap.sh"
end
