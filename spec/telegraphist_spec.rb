require 'spec_helper'

describe Telegraphist, :vcr do
  it 'has a version number' do
    expect(Telegraphist::VERSION).not_to be nil
  end
end
