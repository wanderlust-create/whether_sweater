class DirectionsSerializer
  include JSONAPI::Serializer

  def self.api_format
    {
  "data": {
    "id": nil,
    "type": "munchie",
    "attributes": {
      "destination_city": ,
      "travel_time": ,
      "forecast": {
        "summary": ,
        "temperature":
      },
      "restaurant": {
        "name": ,
        "address":
      }
    }
  }
}
