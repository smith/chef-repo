name "demo_base"
description "base role"
run_list "recipe[git]", "recipe[users::sysadmins]"
