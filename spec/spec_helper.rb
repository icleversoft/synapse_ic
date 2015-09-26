require_relative "../lib/synapse_ic"
require 'support/shared_config'
require 'vcr'
# require File.join(File.dirname(__FILE__), 'fixtures/user_data')

VCR.configure do |c|
  c.cassette_library_dir = "spec/fixtures/vcr_cassettes"
  c.hook_into :webmock
  c.filter_sensitive_data("lClyZ2POv6VukTDgOVpi"){ENV['CLIENT_ID']}
  c.filter_sensitive_data("Gyyvw1kya5pL2eWjingR1wIDtvh9pwjwn3ANigv5"){ENV['CLIENT_SECRET']}
end
# RSpec.configure do |config|
#   config.before(:each) do
#     @api_sandbox = "https://sandbox.synapsepay.com/api/v3/"
#     @api_production = "https://synapsepay.com/api/v3/"
#     @client_id = "lClyZ2POv6VukTDgOVpi"
#     @client_secret = "Gyyvw1kya5pL2eWjingR1wIDtvh9pwjwn3ANigv5"
#   end
# end