module Telegraphist
  class Bot
    include ActiveModel::Model

    attr_accessor :id, :first_name, :username, :client

    def self.create(authentication_token)
      client = Client.new(authentication_token)
      new(client.get(:getMe)['result'].merge(client: client))
    end

    def update_loop(&block)
      last_update = nil
      loop do
        updates(last_update).try(:each) do |update|
          block.call(update)
          last_update = [last_update, update.update_id + 1].compact.max
        end
        sleep 1
      end
    end

    def updates(offset=nil)
      (client.get(:getUpdates, query: {offset: offset})['result'] || []).map do |update|
        Model::Update.new(update)
      end
    end

    def send_message(chat_id, text)
      client.post(:sendMessage, query: {chat_id: chat_id, text: text})
    end
  end
end
