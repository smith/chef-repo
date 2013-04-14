current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "smith"
client_key               "#{current_dir}/smith.pem"
validation_client_name   "nlsmith-validator"
validation_key           "#{current_dir}/nlsmith-validator.pem"
chef_server_url          "https://api.opscode.com/organizations/nlsmith"
cache_type               'BasicFile'
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
cookbook_path            ["#{current_dir}/../cookbooks"]

knife[:digital_ocean_client_id] = ENV['DIGITAL_OCEAN_CLIENT_ID']
knife[:digital_ocean_api_key]   = ENV['DIGITAL_OCEAN_API_KEY']
