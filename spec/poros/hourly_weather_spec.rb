require 'rails_helper'
RSpec.describe HourlyWeather do
  it 'exists with attributes' do
    hourly_weather_data = {
      "dt": 1_650_812_400,
      "temp": 21.58,
      "feels_like": 21.52,
      "pressure": 1023,
      "humidity": 66,
      "dew_point": 14.96,
      "uvi": 0,
      "clouds": 0,
      "visibility": 10_000,
      "wind_speed": 3.15,
      "wind_deg": 152,
      "wind_gust": 4.33,
      "weather": [
        {
          "id": 800,
          "main": 'Clear',
          "description": 'clear sky',
          "icon": '01d'
        }
      ],
      "pop": 0
    }

    hourly_weather = HourlyWeather.new(hourly_weather_data)
    expect(hourly_weather).to be_a HourlyWeather
    expect(hourly_weather.time).to eq('2022-04-24 10:00:00 -0500')
    expect(hourly_weather.temperature).to eq(21.58)
    expect(hourly_weather.conditions).to eq('clear sky')
    expect(hourly_weather.icon).to eq('01d')
  end
end
