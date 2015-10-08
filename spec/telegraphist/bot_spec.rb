require 'spec_helper'

describe Telegraphist::Bot, :vcr do
  let(:authentication_token) { 'sample-token' }
  let(:bot) { Telegraphist::Bot.create(authentication_token) }

  context '.create' do
    it 'creates bot instance' do
      expect(Telegraphist::Bot.create(authentication_token)).to be_an_instance_of(Telegraphist::Bot)
    end
  end

  context '#updates' do
    it do
      expect(bot.updates).to all(be_an(Telegraphist::Model::Update))
    end
  end

end
