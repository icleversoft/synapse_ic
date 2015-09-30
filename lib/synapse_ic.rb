require 'rest_client'
require 'json'

require "synapse_ic/version"
require 'synapse_ic/response'
require 'synapse_ic/resources/user'
require 'synapse_ic/resources/oauth'
require 'synapse_ic/resources/kyc'
require 'synapse_ic/resources/question_set'
require 'synapse_ic/resources/question'
require 'synapse_ic/client'

module SynapseIc
  @api_base = "synapsepay.com/api/v3/"
  @api_version = "v3"
  
  class << self
    attr_accessor :client_id, :client_secret
    attr_accessor :prod, :api_version
    alias_method :prod?, :prod
  end
  
  def self.base_url
    if prod == true
      "https://#{@api_base}"
    else
      "https://sandbox.#{@api_base}"
    end
  end
end
