# frozen_string_literal: true

class BackgroundPhotoSerializer
  include JSONAPI::Serializer

  def self.api_format(image, location)
    {
      "data": {
        "type": 'image',
        "id": image.id,
        "attributes": {
          "image": {
            "location": location,
            "image_url": image.url,
            "credit": {
              "source": 'https://unsplash.com',
              "photographer": image.artist,
              "portfolio": image.portfolio,
              "Guidelines and Crediting": 'https://unsplash.com/documentation#guidelines--crediting'
            }
          }
        }
      }
    }
  end
end
