# See http://docs.opscode.com/config_rb_knife.html for more information on knife configuration options

org = ENV['HEC_CHEF_ORG'] || 'nlsmith'

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "smith"
client_key               "#{current_dir}/smith.pem"
validation_client_name   "nlsmith-validator"
validation_key           "#{current_dir}/nlsmith-validator.pem"
chef_server_url          "https://api.opscode.com/organizations/#{org}"
cache_type               'BasicFile'
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
cookbook_path            ["#{current_dir}/../cookbooks"]
