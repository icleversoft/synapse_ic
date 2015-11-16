module SynapseIc
  class Oauth
    attr_reader :expires_at, :key, :refresh_token
    def initialize( data = {} )
      @expires_at = nil
      @key = ""
      @refresh_token = ""
      unless data.nil?
        @expires_at = Time.at( data['expires_at'].to_i )
        @key = data['oauth_key']
        @refresh_token = data['refresh_token']
      end
    end
  end
end