module Telegraphist
  class Model::Update < Model
    attr_accessor :update_id, :message

    def message=(options={})
      @message = Message.new(options)
    end
  end
end
