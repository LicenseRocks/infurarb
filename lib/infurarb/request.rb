module Infurarb
  class Request
    RPC_METHODS = %i[
      eth_accounts
      eth_blockNumber
      eth_gasPrice
      eth_getBalance
      eth_getBlockByHash
      eth_getBlockByNumber
      eth_getTransactionReceipt
      eth_getBlockTransactionCountByHash
      eth_getBlockTransactionCountByNumber
      eth_getCode
      eth_getLogs
      eth_getStorageAt
      eth_getTransactionByBlockHashAndIndex
      eth_getTransactionByBlockNumberAndIndex
      eth_getUncleByBlockNumberAndIndex
      eth_getUncleCountByBlockHash
      eth_getUncleCountByBlockNumber
      eth_getWork
      eth_hashrate
      eth_mining
      eth_protocolVersion
      eth_syncing
      eth_getTransactionByHash
      eth_getTransactionCount
      web3_clientVersion
      eth_call
      eth_estimateGas
      eth_sendRawTransaction
      eth_submitHashrate
      eth_submitWork
    ].freeze

    attr_reader :endpoint, :method_name, :params
    def initialize(endpoint:, method_name:, params: [])
      @endpoint = endpoint
      @method_name = method_name
      @params = params
    end

    def call
      Response.new(
        HTTP.post(
          endpoint,
          json: { jsonrpc: '2.0', method: method_name, params: params, id: 1 }
        ),
        self
      )
    end
  end
end
