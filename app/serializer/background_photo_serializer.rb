class BackgroundPhotoSerializer
  include JSONAPI::Serializer
  attributes :url, :artist, :portfolio
end
