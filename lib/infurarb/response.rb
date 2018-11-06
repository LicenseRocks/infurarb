module Infurarb
  class Response
    attr_reader :http_response, :request
    def initialize(http_response, request)
      @http_response = http_response
      @request = request
    end

    def body
      @body ||= JSON.parse(http_response.body.readpartial)
    end
  end
end
