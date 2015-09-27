require "spec_helper"

describe SynapseIc do
  include_context 'shared configuration'
  let(:api_keys){synapse_keys}
  let(:env){environment}
  
  context :constants do
    it "version should be equal to 3" do
      expect(SynapseIc.api_version).to eq "v3"
    end
    
    it "base url should contain the right value" do
      expect(SynapseIc.base_url).to eq(env[:sandbox])
      SynapseIc.prod = true
      expect(SynapseIc.base_url).to eq(env[:production])
    end
  end
end