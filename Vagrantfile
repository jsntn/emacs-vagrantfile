Vagrant.configure("2") do |config|
  config.vm.box = "archlinux/archlinux"

  config.vm.provider "virtualbox" do |v|

    # increasing allocated CPU cores and RAM

    host = RbConfig::CONFIG['host_os']

    # Give VM 1/2 system memory
    if host =~ /darwin/
      # sysctl returns Bytes and we need to convert to MB
      mem = `sysctl -n hw.memsize`.to_i / 1024
    elsif host =~ /linux/
      # meminfo shows KB and we need to convert to MB
      mem = `grep 'MemTotal' /proc/meminfo | sed -e 's/MemTotal://' -e 's/ kB//'`.to_i
    elsif host =~ /mswin|mingw|cygwin/
      # Windows code via https://github.com/rdsubhas/vagrant-faster
      mem = `wmic computersystem Get TotalPhysicalMemory`.split[1].to_i / 1024
    end

    mem = mem / 1024 / 2
    v.customize ["modifyvm", :id, "--memory", mem]

    # v.memory = 4096
    v.cpus = 2

    # If you have assigned multiple CPU cores to VirtualBox in your Vagrantfile,
    # you should also enable IO APIC so that the virtual machine can make use of the additional cores.
    # Otherwise, you may notice the virtual machine under performing,
    # and using high amounts of CPU in the guest machine (because of lack of availability of the other cores).

    # enabling multiple cores
    v.customize ["modifyvm", :id, "--ioapic", "on"]

    # faster folder synchronisation
    # Windows users: NFS folders do not work on Windows hosts.
    # Via https://developer.hashicorp.com/vagrant/docs/synced-folders/nfs
    # config.vm.synced_folder ".", "/vagrant", type: "nfs"

  end

  config.ssh.insert_key = false

  # config.vm.provision :shell, :path => "deploy/bootstrap.sh"

end
