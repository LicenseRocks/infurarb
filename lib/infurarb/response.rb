module Infurarb
  class Response
    attr_reader :http_response
    def initialize(http_response)
      @http_response = http_response
    end

    def result
      JSON.parse(http_response.body.readpartial).fetch('result')
    end
  end
end
