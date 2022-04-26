# frozen_string_literal: true

class RoadTripSerializer
  include JSONAPI::Serializer

  def self.api_format(origin, destination, time, eta_weather)
    {
      "data": {
        "id": nil,
        "type": "roadtrip",
        "attributes": {
          "start_city": origin,
          "end_city": destination,
          "travel_time": time.travel_time,
          "weather_at_eta": {
            "temperature": eta_weather[:temp],
            "conditions": eta_weather[:weather][0][:description]
          }
        }
      }
    }
  end
end
