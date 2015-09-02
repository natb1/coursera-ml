# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = '2'
Vagrant.require_version '>= 1.5.0'

ENV['DEPLOY_PATH'] ||= '/opt/ml-coursera'
ENV['DEPLOY_KEY_PATH'] ||= '~/.ssh/id_rsa'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = 'box-cutter/ubuntu1404-desktop'
  config.vm.synced_folder ".", ENV['DEPLOY_PATH'], type: "rsync", rsync__args: ["--verbose", "--archive", "--delete", "-z"]

  config.vm.provision "file", source: "~/.gitconfig", destination: ".gitconfig"
  config.vm.provision "file", source: ENV['DEPLOY_KEY_PATH'], destination: ".ssh/id_rsa"

  config.vm.provision "shell" do |s|
    s.path = "provision/dev-env.sh"
    s.args = [ENV['DEPLOY_PATH']]
  end

  config.vm.provider "virtualbox" do |v|
    v.gui = true
    v.memory = 2048
    v.cpus = 2
  end
end
