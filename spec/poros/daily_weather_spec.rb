require 'rails_helper'
RSpec.describe DailyWeather do
  it 'exists with attributes' do

    daily_weather_data = {
      "dt": 1650819600,
      "sunrise": 1650797752,
      "sunset": 1650845745,
      "moonrise": 1650786420,
      "moonset": 1650823800,
      "moon_phase": 0.79,
      "temp": {
        "day": 22.88,
        "min": 14.9,
        "max": 28.15,
        "night": 19.93,
        "eve": 26.2,
        "morn": 15.96
      },
      "feels_like": {
        "day": 22.66,
        "night": 19.57,
        "eve": 26.2,
        "morn": 15.75
      },
      "pressure": 1023,
      "humidity": 55,
      "dew_point": 13.37,
      "wind_speed": 3.15,
      "wind_deg": 152,
      "wind_gust": 9.01,
      "weather": [
        {
          "id": 802,
          "main": "Clouds",
          "description": "scattered clouds",
          "icon": "03d"
        }
      ],
      "clouds": 37,
      "pop": 0,
      "uvi": 0
    }

    daily_weather = DailyWeather.new(daily_weather_data)
    expect(daily_weather).to be_a DailyWeather
    expect(daily_weather.date).to eq("2022-04-24 12:00:00 -0500")
    expect(daily_weather.sunrise).to eq("2022-04-24 05:55:52 -0500")
    expect(daily_weather.sunset).to eq("2022-04-24 19:15:45 -0500")
    expect(daily_weather.max_temp).to eq(28.15)
    expect(daily_weather.min_temp).to eq(14.9)
    expect(daily_weather.conditions).to eq("scattered clouds")
    expect(daily_weather.icon).to eq("03d")
  end
end
