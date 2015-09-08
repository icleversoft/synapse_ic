require "spec_helper"

module SynapseIC
  context :constants do
    it "version should be equal to 3" do
      expect(SynapseIc.api_version).to eq "v3"
    end
    
    it "base url should contain the right value" do
      expect(SynapseIc.base_url).to eq($api_sandbox )
      SynapseIc.dev = false
      expect(SynapseIc.base_url).to eq($api_production )
    end
  end
end