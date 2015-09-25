require_relative "../lib/synapse_ic"
require File.join(File.dirname(__FILE__), 'fixtures/user_data')

RSpec.configure do |config|
  #some (optional) config here
  config.before(:each) do
    @api_sandbox = "https://sandbox.synapsepay.com/api/v3/"
    @api_production = "https://synapsepay.com/api/v3/"
    @client_id = "lClyZ2POv6VukTDgOVpi"
    @client_secret = "Gyyvw1kya5pL2eWjingR1wIDtvh9pwjwn3ANigv5"
  end
end