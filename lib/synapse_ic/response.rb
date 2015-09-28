module SynapseIc
  class Response
    attr_reader :error, :error_code, :http_code, :success
    def initialize( response = {})
      @error = ""
      @error = response["error"]["en"] unless response["error"].nil?
      @error_code = response["error_code"]
      @http_code = response["http_code"]
      @success = response["success"]
    end
  end
end