shared_context "shared configuration" do
  let(:synapse_keys){ Hash[client_id: ENV['CLIENT_ID'], 
                       client_secret: ENV['CLIENT_SECRET']]}
  let(:environment){Hash[sandbox: "https://sandbox.synapsepay.com/api/v3/",
                         production: "https://synapsepay.com/api/v3/"]}
end