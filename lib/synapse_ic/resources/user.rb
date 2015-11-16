module SynapseIc
  class User < Response
    attr_reader :oauth, :permission
    attr_reader :node, :kyc

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

    def initialize( response = {})
      super( response )
      @oauth = Oauth.new( response["oauth"] )
      @permission = response["user"]["permission"]
    end

    def add_kyc( options = {} )
      @kyc = Client.new.add_kyc_info(@oauth.key, options['kyc_info'], options['fingerprint'] )
    end

    def kyc
      nil unless @kyc.is_a? KYC 
    end

    def add_node(options = {})
      @node = SynapseIc::Client.new.add_node( @oauth.key, options['type'], options['info'], options['fingerprint'] )
    end

    def node
      nil unless @node.is_a? Node 
    end
  end
end
