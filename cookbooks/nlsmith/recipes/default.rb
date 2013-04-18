#
# Cookbook Name:: nlsmith
# Recipe:: default
#
# Copyright (C) 2013 Nathan L Smith
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'apache2'
include_recipe 'apache2::mod_deflate'
include_recipe 'apache2::mod_expires'
include_recipe 'apache2::mod_headers'
include_recipe 'apache2::mod_php5'
include_recipe 'apache2::mod_rewrite'
include_recipe 'mysql::server'
include_recipe 'newrelic'
include_recipe 'newrelic::php-agent'
include_recipe 'php'
include_recipe 'php::module_curl'
include_recipe 'php::module_mysql'
include_recipe 'postfix::sasl_auth'
include_recipe 'sudo'
include_recipe 'vim'

%w[ mailutils s3cmd ].each do |pkg|
  package pkg
end

user 'smith' do
  home '/home/smith'
  shell '/bin/bash'
  supports :manage_home => true
end

group 'admin' do
  members %w[ smith ]
  append true
end

%w[ nlsmith.com gallery.gottung.net gottung.net stmarks-umc.net ].each do |site|
  web_app site do
    template "#{site}.conf.erb"
  end
end

template '/home/smith/.s3cfg' do
  source 's3cfg.erb'
  mode 0600
  owner node['apache']['user']
  group node['apache']['group']
end

cron 'backup' do
  command 'cd /home/smith && s3cmd sync --config=/home/smith/.s3cfg Sites s3://smith-sites > /dev/null'
  minute '0'
  hour '0'
  user node['apache']['user']
  mailto node['apache']['contact']
  action :create
end
