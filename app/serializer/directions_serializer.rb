class DirectionsSerializer
  include JSONAPI::Serializer

  def self.api_format
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
        "name": ,
        "address":
      }
    }
  }
}
