shared_context "shared configuration" do
  let(:synapse_keys){ Hash[client_id: "e3f19e4bd4022c86e7f2", 
                       client_secret: "11c94ba6bad74d24a0158bc707f0fc19a86dc08f"]}
  let(:environment){Hash[sandbox: "https://sandbox.synapsepay.com/api/v3/",
                         production: "https://synapsepay.com/api/v3/"]}
                         
  let(:valid_user) do
    Hash[logins: [{email:"test@domain.com", password: '123456', read_only: false}],
         phone_numbers: ["123-456-789"],
         legal_names: ["Test User"],
         fingerprints: [{fingerprint: "suasusau21324redakufejfjsf"}],
         ips: ["192.168.0.1"]
      ]
  end

  let(:invalid_user) do
    Hash[logins: [{email:"test@domain.com", password: '123456', read_only: false}],
         phone_numbers: ["123-456-789"],
         fingerprints: [{fingerprint: "suasusau21324redakufejfjsf"}],
         ips: ["192.168.0.1"]
      ]
  end
end
