#
# Cookbook Name:: my_app
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

%w(/ releases shared shared/bin shared/config shared/log shared/pids shared/system).each do |directory|
  directory "#{node['my_app']['root']}/#{directory}" do
    owner         node['apache']['user']
    group         node['apache']['group']
    mode          '0755'
    recursive     true
  end
end

redis_server = search(:node, 'role:redis').first

template "#{node['my_app']['root']}/shared/config/redis.yml" do
  source        'config/redis.yml.erb'
  owner         node['apache']['user']
  group         node['apache']['group']
  mode          '0755'
  variables(
    :host => redis_server['ec2']['local_ipv4']
  )
end

memcached_server = search(:node, 'role:memcached').first

template "#{node['my_app']['root']}/shared/config/memcached.yml" do
  source        'config/memcached.yml.erb'
  owner         node['apache']['user']
  group         node['apache']['group']
  mode          '0755'
  variables(
    :host => memcached_server['ec2']['local_ipv4']
  )
end

connection = {
  :host     => 'localhost',
  :username => 'root',
  :password => node['mysql']['server_root_password']
}

mysql_database node['my_app']['database']['database'] do
  connection      connection
  action          :create
end

mysql_database_user node['my_app']['database']['username'] do
  connection      connection
  password        node['my_app']['database']['password']
  action          :create
end

mysql_database_user node['my_app']['database']['username'] do
  connection      connection
  password        node['my_app']['database']['password']
  database_name   node['my_app']['database']['database']
  action          :grant
end

template "#{node['my_app']['root']}/shared/config/database.yml" do
  source        'config/database.yml.erb'
  owner         node['apache']['user']
  group         node['apache']['group']
  mode          '0755'
end

directory "/var/www/.ssh" do
  owner         node['apache']['user']
  group         node['apache']['group']
  mode          '0755'
end

file "/var/www/.ssh/authorized_keys" do
  owner         node['apache']['user']
  group         node['apache']['group']
  mode          '0644'
  content       "[KEY HERE]"
end

template "#{node['apache']['dir']}/sites-available/my_app.conf" do
  source        'apache/my_app.conf.erb'
end

apache_site 'my_app.conf' do
  action :enable
end
