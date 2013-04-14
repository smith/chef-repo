#
# Cookbook Name:: nlsmith
# Attributes:: default
#
# Copyright (C) 2013 Nathan L Smith
#
# All rights reserved - Do Not Redistribute
#

# Tone down apache settings for the tiny server
override['apache']['prefork']['startservers']        = 1
override['apache']['prefork']['minspareservers']     = 1
override['apache']['prefork']['maxspareservers']     = 5
override['apache']['prefork']['serverlimit']         = 50
override['apache']['prefork']['maxclients']          = 50
override['apache']['prefork']['maxrequestsperchild'] = 5000

# And for mysql
override['mysql']['bind_address']                       = '127.0.0.1'
override['mysql']['tunable']['innodb_buffer_pool_size'] = '64M'

# Sudo options
override['authorization']['sudo']['groups']       = %w[ admin ]
override['authorization']['sudo']['passwordless'] = true
