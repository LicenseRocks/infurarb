require 'http'

module Infurarb
  class Connection
    attr_reader :api_key, :network
    def initialize(api_key:, network:)
      @api_key = api_key
      @network = network
    end

    def respond_to_missing?
      true
    end

    def method_missing(method_name, *params)
      return super unless Request::RPC_METHODS.include?(method_name)

      Request.new(endpoint: endpoint, method_name: method_name, params: params).call
    end

    private

    def endpoint
      @endpoint ||= "https://#{network}.infura.io/v3/#{api_key}"
    end
  end
end
