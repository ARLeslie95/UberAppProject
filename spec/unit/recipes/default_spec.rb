#
# Cookbook:: UberAppProject
# Spec:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.
require 'chefspec'
require 'spec_helper'

describe 'UberAppProject::default' do

  context 'When all attributes are default, on Ubuntu 18.04' do
    let(:chef_run) do
      # for a complete list of available platforms and versions see:
      # https://github.com/customink/fauxhai/blob/master/PLATFORMS.md
      runner = ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04')
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
    it 'runs apt get update' do
      expect(chef_run).to update_apt_update 'update'
    end
    it 'should install nginx' do
      expect(chef_run).to install_package 'nginx'
    end

    it 'should enable the nginx service' do
      expect(chef_run).to enable_service 'nginx'
    end

    it 'should start the nginx service' do
      expect(chef_run).to start_service 'nginx'
    end
    it 'should create a proxy.conf template in /etc/nginx/sites-available' do
    expect(chef_run).to create_template("/etc/nginx/sites-available/proxy.conf").with_variables(proxy_port: 7000)
    end

    it 'should create a symlink of proxy.conf from sites-available to sites-enabled' do
      expect(chef_run).to create_link("/etc/nginx/sites-enabled/proxy.conf").with_link_type(:symbolic)
    end

    it 'should delete the symlink from the default config in sites-enabled' do
      expect(chef_run).to delete_link "/etc/nginx/sites-enabled/default"
    end

    it 'runs apt get update' do
      expect(chef_run).to update_apt_update 'update'
    end
    it 'should install python3' do
      expect(chef_run).to install_package('python3')
    end
    it 'should upgrade python' do
      expect(chef_run).to upgrade_package('python3')
    end
    it 'should install python-pip' do
      expect(chef_run).to install_package('python-pip')
    end
    it 'should upgrade python-pip' do
      expect(chef_run).to upgrade_package('python-pip')
    end
    it 'should create a requirements.txt template in /etc/python3/' do
      expect(chef_run).to create_template("/etc/python3/requirements.txt")
    end
    it 'should execute pip install' do
      expect(chef_run).to run_execute('pip install')
    end
    it 'installs nodejs-apt-transport-https' do
    expect(chef_run).to install_package('nodejs-apt-transport-https')
    end
    it 'creates apt-repository nodejs' do
      expect(chef_run).to add_apt_repository('node.js').with(
        uri: 'https://deb.nodesource.com/node_8.x',
        keyserver: 'keyserver.ubuntu.com',
        key: ['1655a0ab68576280']
      )
    end
    it 'installs nodejs' do
      expect(chef_run).to install_package('nodejs')
    end
  end
end
