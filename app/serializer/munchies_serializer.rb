class MunchiesSerializer
  include JSONAPI::Serializer

  def self.api_format(destination, directions, current, restaurant)
    {
      "data": {
        "id": nil,
        "type": "munchie",
        "attributes": {
          "destination_city": destination,
          "travel_time": directions.travel_time,
          "forecast": {
            "summary": current.conditions,
            "temperature": current.temperature
          },
          "restaurant": {
            "name": restaurant.name,
            "address": restaurant.address
          }
        }
      }
    }
  end
end
