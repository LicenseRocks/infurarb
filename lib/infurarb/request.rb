module Infurarb
  class Request
    RPC_METHODS = %i[
      eth_blockNumber
    ].freeze

    attr_reader :endpoint, :method_name, :params
    def initialize(endpoint:, method_name:, params: [])
      @endpoint = endpoint
      @method_name = method_name
      @params = params
      @response = nil
    end

    def call
      response = HTTP.post(
        endpoint,
        json: { jsonrpc: '2.0', method: method_name, params: params, id: 1 }
      )
      Response.new(response)
    end
  end
end
