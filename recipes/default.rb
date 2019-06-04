#
# Cookbook:: UberAppProject
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.
include_recipe "node::default"
include_recipe "python::default"

package 'chef-dk' do
  action [:install, :upgrade]
end
