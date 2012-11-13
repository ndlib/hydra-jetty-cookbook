#
# Cookbook Name:: hydra_jetty
# Recipe:: default
#
# The contents of this file have been relased under the Apache 2 license.
#

# Create service account

group node[:hydra_jetty][:group]

user node[:hydra_jetty][:user] do
  action :create
  group  node[:hydra_jetty][:group]
  home   node[:hydra_jetty][:dir]
  shell  '/bin/bash'
  system true
end

# Install software

directory node[:hydra_jetty][:dir] do
  action    :create
  group     node[:hydra_jetty][:group]
  owner     node[:hydra_jetty][:user]
  recursive true
end

git node[:hydra_jetty][:dir] do
  action     :sync
  group      node[:hydra_jetty][:group]
  reference  node[:hydra_jetty][:git_ref]
  repository node[:hydra_jetty][:git_repo]
  user       node[:hydra_jetty][:user]
end

file node[:hydra_jetty][:log] do
  action :create_if_missing
  group  node[:hydra_jetty][:group]
  owner  node[:hydra_jetty][:user]
end

# Configure service

directory '/var/chef/jetty/bin' do
  action    :create
  recursive true
end

template '/var/chef/jetty/bin/start' do
  mode   '0751'
  source 'jetty/start.erb'
end

template '/var/chef/jetty/bin/stop' do
  mode   '0751'
  source 'jetty/stop.erb'
end

template '/etc/init.d/jettyd' do
  mode   '0751'
  source 'jettyd.erb'
end

service 'jettyd' do
  action [ :enable, :start ]
end
