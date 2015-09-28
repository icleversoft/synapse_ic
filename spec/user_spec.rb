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
  context :create_user_successfully do
    let(:user) do
      VCR.use_cassette("user/success/create") do
        SynapseIc::User.create( valid_user )
      end
    end
    it :error_should_be_empty do
      expect(user.error).to eq("")
    end
    
    it :error_code_should_be_zero do
      expect(user.error_code).to eq("0")
    end
    
    it :creates_successfully_a_user do
      expect( user.success).to eq(true)
    end

    it :user_is_actually_a_user_data_model do
      expect(user).to be_an(SynapseIc::User)
    end
    
  end
  
  
end