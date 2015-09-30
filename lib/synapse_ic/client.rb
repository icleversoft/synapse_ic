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
        res = e.response
      res
    end
  end
end
