shared_context "shared configuration" do
  let(:fingerprint) { Hash[fingerprint: "suasusau21324redakufejfjsf"] }
  let(:synapse_keys){ Hash[client_id: "e3f19e4bd4022c86e7f2", 
                       client_secret: "11c94ba6bad74d24a0158bc707f0fc19a86dc08f"]}
  let(:environment){Hash[sandbox: "https://sandbox.synapsepay.com/api/v3/",
                         production: "https://synapsepay.com/api/v3/"]}

  let(:oauth_key){"x3XV8mJOIL7ldIk3mwgeVBUdpxV9CakMcjhltqnH"}

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
  
  let(:kyc_info) do
    Hash[
      birth_day: 4,
      birth_month: 2,
      birth_year: 1940,
      name_first: "John",
      name_last: "doe",
      address_street1: "1 Infinate Loop",
      address_postal_code: "95014",
      address_country_code: "US",
      document_value: "2222",
      document_type: "SSN"
    ]
  end
  
  let(:kyc_info_to_verify) do
    Hash[
      question_set_id: "560c0aa036356600030004e8",
      answers: [
        {question_id: 1, answer_id: 1},
        {question_id: 2, answer_id: 2},
        {question_id: 3, answer_id: 3}
        ]
      ]
  end
  
  let(:node_synapse) do
    Hash[ nickname: "Savings"]
  end
  
  let(:node_ach_login) do
    Hash[
      bank_id: "synapse_nomfa",
      bank_pw: "test1234",
      bank_name: "bofa"
      ]
  end
  
  let(:node_ach_routing) do
    Hash[
      nickname: "Savings Account",
      name_on_account: "Sankaet Pathak",
      account_num: "123567443",
      routing_num: "051000017",
      type: "PERSONAL",
      class: "CHECKING"
      ]
  end
  
  let(:node_wire_us) do
    Hash[
      nickname: "Some Account",
      name_on_account: "Some Name",
      account_num: "123567443",
      bank_name: "Bank of America",
      address: "452 Fifth Ave, NY"
      ]
  end
  
  let(:node_wire_int) do
    Hash[
      nickname: "Some Account",
      name_on_account: "Some Name",
      account_num: "123567443",
      routing_num: "0260009593",
      swift: "MRMD US 33",
      bank_name: "Bank of America",
      address: "452 Fifth Ave, NY"
      ]
  end

  let(:node_identifier) {  "560cda5686c27325b2ecf372" }
  
  let(:ach_verifier){ Hash[micro: [0.1, 0.1] ] }
end
