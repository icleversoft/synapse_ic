module SynapseIc
  class User
    
    def self.create( params = {} )
      url = SynapseIc.base_url + "/user/create"
      payload = params.merge({"client" => {"client_id" => SynapseIc.client_id,
                                "client_secret" => SynapseIc.client_secret}})
      p payload
      client = Client.request( url, payload)
    end 
  end
end
