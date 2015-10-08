module Telegraphist
  class Model::User < Model
    attr_accessor :id, :first_name, :last_name, :username

    def to_s
      [id, username, [first_name, last_name].compact.join(' ')].join(' :: ')
    end
  end
end
