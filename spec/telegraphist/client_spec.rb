require 'spec_helper'

describe Telegraphist::Client do
  let(:authentication_token) { '' }
  let(:client) { Telegraphist::Client.new(authentication_token) }

  context '#get' do
    it 'makes HTTParty request' do
      expect(Telegraphist::Client).to receive(:get).with('/bot/example', {}).and_return(OpenStruct.new(parsed_response: 'ok'))
      expect(client.get('example')).to eq('ok')
    end
  end

  context '#post' do
    it 'makes HTTParty request' do
      expect(Telegraphist::Client).to receive(:post).with('/bot/example', {}).and_return(OpenStruct.new(parsed_response: 'ok'))
      expect(client.post('example')).to eq('ok')
    end
  end

  context '#url' do
    it do
      expect(client.url('example')).to eq('/bot/example')
    end
  end
end
