# frozen_string_literal: true

class BackgroundPhotoSerializer
  include JSONAPI::Serializer
  attributes :url, :artist, :portfolio
end
