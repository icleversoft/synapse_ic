module Fixtures
  def user_data
    {"logins" => [
                  {
                    "email" => "test@domain.com",
                    "password" => "123456",
                    "read_only" => false
                  }
                 ],
      "phone_numbers" => [
                            "123.123.1234"
                         ],
       "legal_names" => [
                           "Test User"
                        ],
       "fingerprints" => [
                            {
                              "fingerprint" => "suasusau21324redakufejfjsf"
                            }
                         ],
       "ips" => [
                  "127.0.0.1"
                ]
    }
  end
  
  def create_out_200
    {
      "oauth" => {
        "expires_at" => "1442616243",
        "expires_in" => "5184000",
        "oauth_key" => "zMRoCvo4idg4Q2z5f6oHZJt8LRDmAmPQwkxF6wvQ",
        "refresh_token" => "RQRu9GZRnB1NMs8qCzZmBq25l83Adzx9hGjePTZP"
      },
      "success" => true,
      "user" => {
        "_id" => {
          "$oid" => "55ad79b386c273196341ba07"
        },
        "client" => {
          "id" => 724,
          "name" => "Sankaet Pathak"
        },
        "extra" => {
          "date_joined" => {
            "$date" => 1437432243799
          },
          "is_business" => false,
          "supp_id" => "122eddfgbeafrfvbbb"
        },
        "legal_names" => [
          "Test User"
        ],
        "logins" => [
          {
            "email" => "test1@synapsepay.com",
            "read_only" => false
          }
        ],
        "permission" => "UNVERIFIED",
        "phone_numbers" => [
          "901.111.1111"
        ],
        "photos" => [

        ]
      }
    }
  end
  
  def create_out_400
    {
      "error" => {
        "en" => "legal_names must be an instance of basestring not int"
      },
      "success" => false
    }
  end
  
end
