# nlsmith.com cookbook

This gets lots of stuff set up for nlsmith.com and the other sites I host on there.

# Requirements

Other things that have to be done manually:

* Set up smith's authorized\_keys
* Set up the site files
* Install the mod\_cloudflare apache module
* Ensure the "smith-sites" S3 bucket exists

# Attributes

Some of the attributes (the secret ones) need to be set manually on the node:

* `node['aws']['access_key_id']`
* `node['aws']['secret_access_key']`
* `node['newrelic']['application_monitoring']['license']`
* `node['newrelic']['server_monitoring']['license']`
* `node['postfix']['smtp_sasl_password']`
* `node['postfix']['smtp_sasl_username']`

# Author

Author:: Nathan L Smith <nlloyds@gmail.com>
