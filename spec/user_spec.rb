require "spec_helper"

describe :user do
  let(:user){ build_stubbed(:user, Fixtures.user_data)}
  before(:each) do
    SynapseIc.client_id = @client_id 
    SynapseIc.client_secret = @client_secret
  end
  
  it "should create a client successfully" do
    allow(SynapseIc::User).to receive(:persisted?).and_return( true )

    
    
    # RestClient = double
    # response = double
    # allow(response).to receive(:code) {"200"}
    # allow(response).to receive(:body) { Fixtures.create_out_200}
    # p response.code

    # response.stub(:code) { 200 }
    # d = SynapseIc::User.create( Fixtures.user_data )
    # d = Client.request( SynapseIc)
  end
end