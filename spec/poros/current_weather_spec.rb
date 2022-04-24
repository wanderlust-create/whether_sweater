require 'rails_helper'
RSpec.describe CurrentWeather do
  it 'exists with attributes' do
    current_weather_data = {
      "dt": 1_650_813_888,
      "sunrise": 1_650_797_752,
      "sunset": 1_650_845_745,
      "temp": 21.58,
      "feels_like": 21.52,
      "pressure": 1023,
      "humidity": 66,
      "dew_point": 14.96,
      "uvi": 0,
      "clouds": 0,
      "visibility": 10_000,
      "wind_speed": 2.57,
      "wind_deg": 0,
      "weather": [
        {
          "id": 800,
          "main": 'Clear',
          "description": 'clear sky',
          "icon": '01d'
        }
      ]
    }

    current_weather = CurrentWeather.new(current_weather_data)
    expect(current_weather).to be_a CurrentWeather
    expect(current_weather.datetime).to eq('2022-04-24 10:24:48 -0500')
    expect(current_weather.sunrise).to eq('2022-04-24 05:55:52 -0500')
    expect(current_weather.sunset).to eq('2022-04-24 19:15:45 -0500')
    expect(current_weather.temperature).to eq(21.58)
    expect(current_weather.feels_like).to eq(21.52)
    expect(current_weather.humidity).to eq(66)
    expect(current_weather.uvi).to eq(0)
    expect(current_weather.visibility).to eq(10_000)
    expect(current_weather.conditions).to eq('clear sky')
    expect(current_weather.icon).to eq('01d')
  end
end
