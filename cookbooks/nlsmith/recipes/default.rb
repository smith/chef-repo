#
# Cookbook Name:: nlsmith
# Recipe:: default
#
# Copyright (C) 2013 Nathan L Smith
#
# All rights reserved - Do Not Redistribute
#

# chef-vault must be included first
include_recipe 'chef-vault'

secrets = chef_vault_item('vault', 'secrets')

# Site-specific attriubtes
node.default['newrelic']['application_monitoring']['license'] =
  secrets['newrelic']['application_monitoring']['license']
node.default['newrelic']['server_monitoring']['license'] =
  secrets['newrelic']['server_monitoring']['license']
node.default['postfix']['sasl']['smtp_sasl_user_name'] =
  secrets['postfix']['sasl']['smtp_sasl_user_name']
node.default['postfix']['sasl']['smtp_sasl_passwd'] =
  secrets['postfix']['sasl']['smtp_sasl_passwd']

include_recipe 'apache2'
include_recipe 'apache2::mod_deflate'
include_recipe 'apache2::mod_expires'
include_recipe 'apache2::mod_headers'
include_recipe 'apache2::mod_php5'
include_recipe 'apache2::mod_rewrite'
include_recipe 'chef-client'
include_recipe 'mysql::server'
include_recipe 'newrelic'
include_recipe 'newrelic::php-agent'
include_recipe 'php'
include_recipe 'php::module_curl'
include_recipe 'php::module_mysql'
include_recipe 'postfix::sasl_auth'
include_recipe 'sudo'
include_recipe 'unattended_upgrades'
include_recipe 'vim'

%w[ ack-grep mailutils ncftp s3cmd unzip zip ].each do |pkg|
  package pkg
end

user 'smith' do
  home '/home/smith'
  shell '/bin/bash'
  supports :manage_home => true
end

# Rob Beland, for St. Mark's youth site.
user 'rob' do
  home '/home/rob'
  shell '/bin/bash'
  supports :manage_home => true
end

group 'admin' do
  members %w[ smith ]
  append true
end

%w[ iowajs.org nlsmith.com gottung.net stmarks-umc.net ].each do |site|
  web_app site do
    template "#{site}.conf.erb"
  end
end

template '/home/smith/.s3cfg' do
  source 's3cfg.erb'
  mode 0600
  owner node['apache']['user']
  group node['apache']['group']
  variables(secrets: secrets)
end

cron 'backup' do
  command 'cd /home/smith && s3cmd sync --config=/home/smith/.s3cfg --exclude=*/cache/* Sites s3://smith-sites > /dev/null'
  minute '0'
  hour '0'
  user node['apache']['user']
  mailto node['apache']['contact']
  action :create
end
