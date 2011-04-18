name "demo_database_master"
description "Database master"
run_list "role[demo_base]", "recipe[demo::database_master]",
         "recipe[database::master]"
