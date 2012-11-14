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


# Enable logging

directory File.join(node[:hydra_jetty][:dir], 'etc') do
  action    :create
  group     node[:hydra_jetty][:group]
  owner     node[:hydra_jetty][:user]
  recursive true
end

template File.join(node[:hydra_jetty][:dir], 'etc', 'jetty-logging.xml') do
  mode   '0644'
  source 'jetty_logging.xml.erb'
end


# Configure service

template '/etc/default/jetty' do
  mode   '0644'
  source 'jetty_conf.erb'
end

template '/etc/init.d/jetty' do
  mode   '0751'
  source 'jetty.sh'
end

service 'jetty' do
  action [ :enable, :restart ]
end
