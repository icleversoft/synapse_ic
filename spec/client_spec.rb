require 'spec_helper'

describe SynapseIc::Client do
  include_context 'shared configuration'
  let(:api_keys){synapse_keys}
  let(:env){environment}

  before(:each) do
    SynapseIc.prod = false
    SynapseIc.client_id = api_keys[:client_id]
    SynapseIc.client_secret = api_keys[:client_secret]
  end
  
  context :add_kyc_info do
    context :success do
      subject do
        VCR.use_cassette("client/success_verified_kyc_info") do
          SynapseIc::Client.new.add_kyc_info( oauth_key, kyc_info, fingerprint )
        end
      end
      its(:error_code){should eq("0")}
      it{should be_a(SynapseIc::KYC)}
      its(:message){should match(/SSN information verified/)}
      its(:permission){should match(/RECEIVE/)}
      its(:question_set){is_expected.to be_nil}
      its("verify_required?"){is_expected.to be_falsey}
    end
    
    context :validation_fails do
      subject do
        VCR.use_cassette("client/validation_fails_kyc_info") do
          x = kyc_info.dup
          x[:document_value] = "1111"
          SynapseIc::Client.new.add_kyc_info( oauth_key, x, fingerprint )
        end
      end
  
      it{should be_a(SynapseIc::Response)}
      its(:error_code){should_not eq("0")}
      its(:error){should match(/invalid SSN information/i)}
    end
    # 
    context :success_but_not_verified do
      subject do
        VCR.use_cassette("client/not_verified_kyc_info") do
          x = kyc_info.dup
          x[:document_value] = "3333"
          SynapseIc::Client.new.add_kyc_info( oauth_key, x, fingerprint )
        end
      end
  
      it{should be_a(SynapseIc::KYC)}
      its(:success){is_expected.to be_truthy}
      its(:error_code){should_not eq("0")}
      its(:message){should_not be_empty}
      its(:message){is_expected.to match(/and post them to user\/doc\/verify/)}
      its(:question_set){should_not eq(nil)}
      its(:question_set){should be_a(SynapseIc::QuestionSet)}
      its("verify_required?"){is_expected.to be_truthy}
      its("question_set.question_set_id"){should_not be_empty}
      its("question_set.questions"){should_not be_empty}
      its("question_set.questions.size"){should eq(5)}
      its("question_set.questions.first"){should be_a(SynapseIc::Question)}
      its("question_set.questions.first.question_id"){should_not be_nil }
      its("question_set.questions.first.question"){should_not be_empty }
      its("question_set.questions.first.answers"){should_not be_empty }
    end
  end
end