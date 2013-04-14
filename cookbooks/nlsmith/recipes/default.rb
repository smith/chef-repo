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
include_recipe 'postfix::sasl_auth'
include_recipe 'sudo'
include_recipe 'vim'

package 'mailutils'

user 'smith' do
  home '/home/smith'
  shell '/bin/bash'
  supports :manage_home => true
end

group 'admin' do
  members %w[ smith ]
  append true
end
