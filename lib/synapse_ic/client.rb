module SynapseIc
  class Client 
    
    def self.request( url, payload = {})
      res = nil
      
      res = RestClient.post( url,
                             payload.to_json, 
                             content_type: :json, 
                             accept: :json)
      res = res.body
      rescue => e
        res = {"error" => {"en" => e.message},
               "error_code" => -1,
               "http_code" => 500,
               "success" => false}.to_json
      res
    end
  end
end
