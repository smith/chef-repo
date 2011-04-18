name "demo_cache"
description "memcached server"
run_list "role[demo_base]", "recipe[demo::cache]", "recipe[memcached]"
