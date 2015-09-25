require 'rest_client'
require 'json'

require "synapse_ic/version"
require 'synapse_ic/resources/user'
require 'synapse_ic/client'

module SynapseIc
  @api_base = "synapsepay.com/api/v3/"
  @api_version = "v3"
  
  class << self
    attr_accessor :client_id, :client_secret
    attr_accessor :dev, :api_version
    alias_method :dev?, :dev
  end
  
  def self.base_url
    if dev.nil? || dev == true
      "https://sandbox.#{@api_base}"
    else
      "https://#{@api_base}"
    end
  end
end
