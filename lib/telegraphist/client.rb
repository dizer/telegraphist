module Telegraphist
  class Client
    include HTTParty
    base_uri 'https://api.telegram.org/'

    attr_reader :options, :authentication_token

    def initialize(authentication_token)
      @authentication_token = authentication_token
      @options = {}
    end

    def get(path, payload={})
      self.class.get(url(path), options.deep_merge(payload)).parsed_response
    end

    def post(path, payload={})
      self.class.post(url(path), options.deep_merge(payload)).parsed_response
    end

    def url(path)
      ['/', 'bot', authentication_token, '/', path].join
    end
  end
end
