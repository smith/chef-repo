name             "nlsmith"
maintainer       "Nathan L Smith"
maintainer_email "nlloyds@gmail.com"
license          "All rights reserved"
description      "Installs/Configures stuff for nlsmith.com and other sites on there."
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.4.3"
supports         "ubuntu"
depends          "apache2"
depends          "chef-client"
depends          "chef-vault"
depends          "mysql"
depends          "newrelic"
depends          "php"
depends          "postfix"
depends          "sudo"
depends          "unattended_upgrades"
depends          "vim"
