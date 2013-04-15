# nlsmith.com cookbook

This gets lots of stuff set up for nlsmith.com and the other sites I host on there.

# Requirements

Other things that have to be done manually:

* Set up smith's authorized\_keys
* Set up the site files
* Install the mod\_cloudflare apache module

# Attributes

Some of the attributes (the secret ones) need to be set manually on the node:

* `node['newrelic']['application_monitoring']['license']`
* `node['newrelic']['server_monitoring']['license']`
* `node['postfix']['smtp_sasl_password']`
* `node['postfix']['smtp_sasl_username']`

# Author

Author:: Nathan L Smith <nlloyds@gmail.com>
