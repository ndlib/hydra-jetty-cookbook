#
# Cookbook Name:: hydra-jetty
# Recipe:: default
#
# The contents of this file have been relased under the Apache 2 license.
#

directory "/var/hydra-jetty/" do
  owner 'root'
  group 'root'
  action :create
end
