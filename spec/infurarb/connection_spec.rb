module Infurarb
  RSpec.describe Connection do
    let(:connection) { described_class.new(api_key: 'ABCXYZ', network: 'foo') }

    describe '#api_key' do
      subject { connection.api_key }
      it { is_expected.to eq('ABCXYZ') }
    end

    describe '#network' do
      subject { connection.network }
      it { is_expected.to eq('foo') }
    end

    describe '#method_missing' do
      context 'method defined in Request' do
        let(:response) { double(:response) }

        before do
          stub_request(:post, 'https://foo.infura.io/v3/ABCXYZ')
            .with(
              body: {
                jsonrpc: '2.0', method: 'eth_getTransactionReceipt', params: ['0xqwe123'], id: 1
              }.to_json
            )
            .to_return(status: 200, body: { result: '0x111' }.to_json, headers: {})
        end

        it 'initializes and calls a Request' do
          expect(connection.eth_getTransactionReceipt('0xqwe123').body['result']).to eq('0x111')
        end
      end

      context 'method not defined in Request' do
        it 'raises an error' do
          expect { connection.eth_hodl('0xqwe123').body['result'] }.to raise_error NoMethodError
        end
      end
    end
  end
end
