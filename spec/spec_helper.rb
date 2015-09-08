require_relative "../lib/synapse_ic"

RSpec.configure do |config|
  #some (optional) config here
  config.before(:each) do
    $api_sandbox = "https://sandbox.synapsepay.com/api/v3/"
    $api_production = "https://synapsepay.com/api/v3/"
  end
end