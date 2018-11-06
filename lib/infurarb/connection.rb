require 'http'

module Infurarb
  class Connection
    attr_reader :args
    private :args

    RPC_METHODS = %i[
      eth_blockNumber
    ].freeze

    def initialize(args = {})
      @args = args
    end

    def respond_to_missing?
      true
    end

    def method_missing(method)
      binding.pry
      if RPC_METHODS.include?(method)
        HTTP.post(
          'https://mainnet.infura.io/',
          json: { jsonrpc: '2.0', method: method, params: [], id: 1 }
        )
      else
        super
      end
    end
  end
end
