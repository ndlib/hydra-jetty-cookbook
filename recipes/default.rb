#
# Cookbook Name:: hydra_jetty
# Recipe:: default
#
# The contents of this file have been relased under the Apache 2 license.
#

group node[:hydra_jetty][:group]

user node[:hydra_jetty][:user] do
  group node[:hydra_jetty][:group]
  action :create
  system true
  shell '/bin/false'
end

git node[:hydra_jetty][:dir] do
  repository node[:hydra_jetty][:git_repo]
  reference node[:hydra_jetty][:git_ref]
  user node[:hydra_jetty][:user]
  group node[:hydra_jetty][:group]
  action :sync
end
