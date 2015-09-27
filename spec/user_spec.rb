require 'spec_helper'

describe SynapseIc::User do
  include_context 'shared configuration'
  let(:api_keys){synapse_keys}
  let(:env){environment}
  before(:each) do
    SynapseIc.prod = false
    SynapseIc.client_id = api_keys[:client_id]
    SynapseIc.client_secret = api_keys[:client_secret]
  end
  it :should_create_a_synapse_user do
    VCR.use_cassette("user/create") do
      res = SynapseIc::User.create( "logins" => [{"email"=>"test@domain.com", 
                                            "password" => "123456", 
                                            "read_only" => "false"}], 
                              "phone_numbers" => ["123-123-123"],
                              "legal_names" => ["Test User"],
                              "fingerprints" => [{"fingerprint" => "suasusau21324redakufejfjsf"} ],
                              "ips" => ["127.0.0.1"] )
    end
  end
  
end