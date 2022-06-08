# frozen_string_literal: true

class UsersSerializer
  include JSONAPI::Serializer
  def self.api_format(user)
    {
      data: {
        type: 'users',
        id: user.id,
        attributes: {
          email: user.email,
          api_key: user.api_key
        }
      }
    }
  end
end
