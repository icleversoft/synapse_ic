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
      request_node_action( oauth_key, url, fingerprint, info, type )
    end

    def verify_node( oauth_key, fingerprint, node_identifier, verifier )
      url = SynapseIc.base_url + "node/verify"
      request_node_verification( oauth_key, url, fingerprint, node_identifier, verifier )
    end

    def list_node( oauth_key, fingerprint )
      url = SynapseIc.base_url + "node/show"
      request_node_action( oauth_key, url, fingerprint )
    end
    
    def add_transaction(oauth_key, fingerprint, transaction )
    end
private

    def payload_for_kyc( oauth_key, info, fingerprint )
      user_doc = {doc: info}.merge(fingerprint)
      {login: {oauth_key: oauth_key}, user: user_doc}
    end

    def payload_for_node( oauth_key, fingerprint, info = {}, type = '')
      req_info = {login: {oauth_key: oauth_key}, user: fingerprint}
      unless info.empty? && type.empty?
        req_info.merge!(node: {type: type, info: info})
      end
      req_info
    end
    
    def payload_for_node_verification(oauth_key, fingerprint, node_identifier, verifier)
      {login: {oauth_key: oauth_key}, user: fingerprint,
       node: {_id: {"$oid" => node_identifier}, "verify" => verifier}}
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
    
    def request_node_action(oauth_key, url, fingerprint, info = {}, type = '' )
      response = JSON.parse( Client.request( url, payload_for_node(oauth_key, fingerprint, info, type) ) )

      if response.has_key? "error"
        out = Response.new( response )
      else
        if info.empty?
          out = NodeList.new( response )
        else
          out = Node.new( response )
        end
      end
      out
    end
    
    def request_node_verification( oauth_key, url, fingerprint, node_identifier, verifier )
      response = JSON.parse( Client.request( url, payload_for_node_verification(oauth_key, fingerprint, node_identifier, verifier) ) )

      if response.has_key? "error"
        out = Response.new( response )
      else
        out = Node.new( response )
      end
      out
    end
  end
end
