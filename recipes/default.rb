#
# Cookbook Name:: unattended-upgrades
# Recipe:: default
#

include_recipe "apt"

package "unattended-upgrades"

package "mailutils" if node["unattended-upgrades"]["send_email"]

template "/etc/apt/apt.conf.d/50unattended-upgrades" do
  source "50unattended-upgrades.erb"
  owner "root"
  group "root"
  mode "0644"
end

template "/etc/apt/apt.conf.d/20auto-upgrades" do
  source "20auto-upgrades.erb"
  owner "root"
  group "root"
  mode "0644"
end
