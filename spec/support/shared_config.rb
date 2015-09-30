shared_context "shared configuration" do
  let(:fingerprint) { Hash[fingerprint: "suasusau21324redakufejfjsf"] }
  let(:synapse_keys){ Hash[client_id: "e3f19e4bd4022c86e7f2", 
                       client_secret: "11c94ba6bad74d24a0158bc707f0fc19a86dc08f"]}
  let(:environment){Hash[sandbox: "https://sandbox.synapsepay.com/api/v3/",
                         production: "https://synapsepay.com/api/v3/"]}
                         
  let(:valid_user) do
    Hash[logins: [{email:"test@domain.com", password: '123456', read_only: false}],
         phone_numbers: ["123-456-789"],
         legal_names: ["Test User"],
         fingerprints: [fingerprint],
         ips: ["192.168.0.1"]
      ]
  end

  let(:invalid_user) do
    Hash[logins: [{email:"test@domain.com", password: '123456', read_only: false}],
         phone_numbers: ["123-456-789"],
         fingerprints: [fingerprint],
         ips: ["192.168.0.1"]
      ]
  end
  
  let(:success_kyc_info) do
    Hash[birth_day: 4,
    birth_month: 2,
    birth_year: 1940,
    name_first: "John",
    name_last: "doe",
    address_street1: "1 Infinate Loop",
    address_postal_code: "95014",
    address_country_code: "US",
    document_value: "2222",
    document_type: "SSN"]
  end

  let(:success_not_verified_kyc_info) do
    Hash[birth_day: 4,
    birth_month: 2,
    birth_year: 1940,
    name_first: "John",
    name_last: "doe",
    address_street1: "1 Infinate Loop",
    address_postal_code: "95014",
    address_country_code: "US",
    document_value: "3333",
    document_type: "SSN"]
  end
  
  
end
