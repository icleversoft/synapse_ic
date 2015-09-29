module SynapseIc
  class Oauth
    attr_reader :expires_at, :oauth_key, :refresh_token
    def initialize( data = {} )
      @expires_at = nil
      @oauth_key = ""
      @refresh_token = ""
      unless data.nil?
        @expires_at = Time.at( data['expires_at'].to_i )
        @oauth_key = data['oauth_key']
        @refresh_token = data['refresh_token']
      end
    end
  end
end