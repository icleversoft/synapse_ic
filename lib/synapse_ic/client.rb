module SynapseIc
  class Client 
    
    def self.request( url, payload = {})
      res = nil
      res = RestClient.post( url,
                             payload.to_json, 
                             content_type: :json, 
                             accept: :json)
      rescue => e
        puts e.message
      JSON.parse(res) unless res.nil?  
    end
  end
end
