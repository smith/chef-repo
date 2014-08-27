#
# Cookbook Name:: nlsmith
# Attributes:: default
#
# Copyright (C) 2013 Nathan L Smith
#
# All rights reserved - Do Not Redistribute
#

# Tone down apache settings for the tiny server
set['apache']['contact'] = 'smith@nlsmith.com'
set['apache']['prefork']['startservers']        = 1
set['apache']['prefork']['minspareservers']     = 1
set['apache']['prefork']['maxspareservers']     = 5
set['apache']['prefork']['serverlimit']         = 50
set['apache']['prefork']['maxclients']          = 50
set['apache']['prefork']['maxrequestsperchild'] = 5000

# And for mysql
set['mysql']['bind_address']                       = '127.0.0.1'
set['mysql']['tunable']['innodb_buffer_pool_size'] = '64M'

# Newrelic
set['newrelic']['startup_mode'] = 'external'
default['newrelic']['application_monitoring']['app_name'] = 'WordPress'

# Postfix
# These don't get loaded properly by the postfix cookbook
default['postfix']['main']['smtp_sasl_auth_enable'] = 'yes'
default['postfix']['sasl_password_file'] = "#{node['postfix']['conf_dir']}/sasl_passwd"
default['postfix']['main']['smtp_sasl_password_maps'] = "hash:#{node['postfix']['sasl_password_file']}"
default['postfix']['main']['smtp_sasl_security_options'] = 'noanonymous'
node.default['postfix']['main']['relayhost'] = '[smtp.sendgrid.net]:587'

# Sudo
set['authorization']['sudo']['groups']       = %w[ adm admin ]
set['authorization']['sudo']['passwordless'] = true
