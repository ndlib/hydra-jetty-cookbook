#
# Cookbook Name:: hydra_jetty
# Recipe:: default
#
# The contents of this file have been relased under the Apache 2 license.
#

user node[:hydra_jetty][:user] do
  action :create
  system true
  shell '/bin/false'
end

group node[:hydra_jetty][:group] do
  append node[:hydra_jetty][:group]
end

directory node[:hydra_jetty][:dir]  do
  owner node[:hydra_jetty][:user]
  group node[:hydra_jetty][:group]
  action :create_if_missing
end

git node[:hydra_jetty][:dir] do
  repository node[:hydra_jetty][:git_repo]
  reference node[:hydra_jetty][:git_ref]
  action :sync
end
