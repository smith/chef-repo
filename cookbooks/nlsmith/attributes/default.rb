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

# Sudo options
set['authorization']['sudo']['groups']       = %w[ admin ]
set['authorization']['sudo']['passwordless'] = true
