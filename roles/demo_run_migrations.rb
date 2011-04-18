name "demo_run_migrations"
description "Migration running role"
default_attributes :apps => { :demo => { :production => {
  :run_migrations => true } } }
