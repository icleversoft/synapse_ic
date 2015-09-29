module SynapseIc
  class User < Response

    class << self
      def create( params = {} )
        url = SynapseIc.base_url + "user/create"

        payload = params.merge({"client" => {"client_id" => SynapseIc.client_id,
                                  "client_secret" => SynapseIc.client_secret}})

        response = JSON.parse( Client.request( url, payload) )
        
        if response.has_key? "error"
          Response.new( response )
        else
          User.new( response )
        end
      end 
    end

    attr_reader :oauth, :permission
    def initialize( response = {})
      super( response )
      @oauth = Oauth.new( response["oauth"] )
      @permission = response["user"]["permission"]
    end

  end
end
