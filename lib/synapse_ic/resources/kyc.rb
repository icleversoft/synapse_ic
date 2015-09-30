module SynapseIc
  class KYC < Response
    attr_reader :message, :permission
    def initialize( data = {} )
      @message = data["message"]["en"]
      @permission = data["user"]["permission"]
    end
  end
end