shared_context "shared configuration" do
  let(:synapse_keys){ Hash[client_id: "e3f19e4bd4022c86e7f2", 
                       client_secret: "11c94ba6bad74d24a0158bc707f0fc19a86dc08f"]}
  let(:environment){Hash[sandbox: "https://sandbox.synapsepay.com/api/v3/",
                         production: "https://synapsepay.com/api/v3/"]}
end
