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

    def add_kyc_info( oauth_key, info = {}, fingerprint )
      url = SynapseIc.base_url + "user/doc/add"
      request_kyc_action( oauth_key, url, info, fingerprint )
    end

    def verify_kyc_info( oauth_key, info = {}, fingerprint )
      url = SynapseIc.base_url + "user/doc/verify"
      request_kyc_action( oauth_key, url, info, fingerprint )
    end

    def add_node( oauth_key, type, info = {}, fingerprint )
      url = SynapseIc.base_url + "node/add"
      request_node_action( oauth_key, url, type, info, fingerprint )
    end
    
private

    def payload_for_kyc( oauth_key, info, fingerprint )
      user_doc = {doc: info}.merge(fingerprint)
      {login: {oauth_key: oauth_key}, user: user_doc}
    end

    def payload_for_node( oauth_key, type, info, fingerprint )
      node_info = {type: type, info: info}
      {login: {oauth_key: oauth_key}, user: fingerprint, node: node_info}
    end
    
    def request_kyc_action(oauth_key, url, info, fingerprint )
      response = JSON.parse( Client.request( url, payload_for_kyc(oauth_key, info, fingerprint) ) )

      if response.has_key? "error"
        out = Response.new( response )
      else
        out = KYC.new( response )
      end
      out
    end
    
    def request_node_action(oauth_key, url, type, info, fingerprint )
      response = JSON.parse( Client.request( url, payload_for_node(oauth_key, type, info, fingerprint) ) )

      if response.has_key? "error"
        out = Response.new( response )
      else
        out = Node.new( response )
      end
      out
    end
    
  end
end
