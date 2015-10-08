module Telegraphist
  class Model::Message < Model
    attr_accessor :message_id, :from, :date, :chat, :forward_from, :forward_date, :reply_to_message, :text, :audio,
                  :document, :photo, :sticker, :video, :contact, :location, :new_chat_participant,
                  :left_chat_participant, :new_chat_title, :new_chat_photo, :delete_chat_photo, :group_chat_created

    def from=(options={})
      @from = User.new(options)
    end

    def chat=(options={})
      @chat = if options['title']
                GroupChat.new(options)
              else
                User.new(options)
              end
    end
  end
end
