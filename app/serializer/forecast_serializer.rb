# frozen_string_literal: true

class ForecastSerializer
  include JSONAPI::Serializer

  def self.api_format(current, daily, hourly)
    {
      "data": {
        "id": nil,
        "type": 'forecast',
        "attributes": {
          "current_weather": {
            "datetime": current.datetime,
            "sunrise": current.sunrise,
            "sunset": current.sunset,
            "temperature": current.temperature,
            "feels_like": current.feels_like,
            "humidity": current.humidity,
            "uvi": current.uvi,
            "visibility": current.visibility,
            "conditions": current.conditions,
            "icon": current.icon
          },
          "daily_weather": [
            {
              "date": daily[0].date,
              "sunrise": daily[0].sunrise,
              "sunset": daily[0].sunset,
              "max_temp": daily[0].max_temp,
              "min_temp": daily[0].min_temp,
              "conditions": daily[0].conditions,
              "icon": daily[0].icon
            },
            {
              "date": daily[1].date,
              "sunrise": daily[1].sunrise,
              "sunset": daily[1].sunset,
              "max_temp": daily[1].max_temp,
              "min_temp": daily[1].min_temp,
              "conditions": daily[1].conditions,
              "icon": daily[1].icon
            },
            {
              "date": daily[2].date,
              "sunrise": daily[2].sunrise,
              "sunset": daily[2].sunset,
              "max_temp": daily[2].max_temp,
              "min_temp": daily[2].min_temp,
              "conditions": daily[2].conditions,
              "icon": daily[2].icon
            },
            {
              "date": daily[3].date,
              "sunrise": daily[3].sunrise,
              "sunset": daily[3].sunset,
              "max_temp": daily[3].max_temp,
              "min_temp": daily[3].min_temp,
              "conditions": daily[3].conditions,
              "icon": daily[3].icon
            },
            {
              "date": daily[4].date,
              "sunrise": daily[4].sunrise,
              "sunset": daily[4].sunset,
              "max_temp": daily[4].max_temp,
              "min_temp": daily[4].min_temp,
              "conditions": daily[4].conditions,
              "icon": daily[4].icon
            }
          ],
          "hourly_weather": [
            {
              "time": hourly[0].time,
              "temperature": hourly[0].temperature,
              "conditions": hourly[0].conditions,
              "icon": hourly[0].icon
            },
            {
              "time": hourly[1].time,
              "temperature": hourly[1].temperature,
              "conditions": hourly[1].conditions,
              "icon": hourly[1].icon
            },
            {
              "time": hourly[2].time,
              "temperature": hourly[2].temperature,
              "conditions": hourly[2].conditions,
              "icon": hourly[2].icon
            },
            {
              "time": hourly[3].time,
              "temperature": hourly[3].temperature,
              "conditions": hourly[3].conditions,
              "icon": hourly[3].icon
            },
            {
              "time": hourly[4].time,
              "temperature": hourly[4].temperature,
              "conditions": hourly[4].conditions,
              "icon": hourly[4].icon
            },
            {
              "time": hourly[5].time,
              "temperature": hourly[5].temperature,
              "conditions": hourly[5].conditions,
              "icon": hourly[5].icon
            },
            {
              "time": hourly[6].time,
              "temperature": hourly[6].temperature,
              "conditions": hourly[6].conditions,
              "icon": hourly[6].icon
            },
            {
              "time": hourly[7].time,
              "temperature": hourly[7].temperature,
              "conditions": hourly[7].conditions,
              "icon": hourly[7].icon
            }
          ]
        }
      }
    }
  end
end
