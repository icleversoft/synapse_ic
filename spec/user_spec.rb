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

    it :responds_to_add_kyc_info do
      expect(user).to respond_to(:add_kyc_info)
    end

    context :permission do
      subject{user.permission}
      
      it{should_not be_empty}
      it{should match(/(UNVERIFIED|RECEIVE|LOCKED|SEND\-AND\-RECEIVE)/)}
    end
    
    context :oauth do
      subject{user.oauth}
      
      it {should be_a(SynapseIc::Oauth) }
      its(:expires_at){ should be_a(Time) }
      its(:oauth_key){ should_not be_empty }
      its(:refresh_token){ should_not be_empty }
    end
    
    context :add_kyc_info do
      context :success do
        subject do
          VCR.use_cassette("user/success/success_verified_kyc_info") do
            user.add_kyc_info( success_kyc_info, fingerprint )
          end
        end
        
        its(:error_code){should eq("0")}
        it{should be_a(SynapseIc::KYC)}
        its(:message){should match(/SSN information verified/)}
        its(:permission){should match(/RECEIVE/)}
      end
      context :validation_fails do
        subject do
          VCR.use_cassette("user/success/validation_fails_kyc_info") do
            user.add_kyc_info( validation_fails_kyc_info, fingerprint )
          end
        end
      
        it{should be_a(SynapseIc::Response)}
        its(:error_code){should_not eq("0")}
        its(:error){should match(/Invalid SSN information/)}
      end
      
    end
  end
  
  context :user_cant_be_created do
    let(:user) do
      VCR.use_cassette("user/error/create") do
        SynapseIc::User.create( invalid_user )
      end
    end
    it :error_should_not_be_empty do
      expect(user.error).not_to be_empty
    end
    it :error_code_should_not_be_zero do
      expect(user.error_code).to eq("200")
    end

    it :http_code_should_not_be_zero do
      expect(user.http_code).to eq("400")
    end
    
    it :error_contains_the_right_message do
      expect(user.error).to match(/legal_names/)
    end

    it :actually_returns_a_responce_instead_of_user do
      expect(user).to be_an(SynapseIc::Response)
    end
    
    it :does_not_respond_to_add_kyc_info do
      expect(user).not_to respond_to(:add_kyc_info)
    end
  end
  
  
end