name "demo_web_app"
description "Web and application server"
run_list "role[demo_base]", "recipe[demo]", "recipe[application]"
