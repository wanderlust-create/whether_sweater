# frozen_string_literal: true

class ForecastFacade
  def self.location(given_location)
    location_details = MapquestGeocodingService.get_lat_lon(given_location)[:results][0][:locations][0]
    data = Location.new(location_details)
  end

  def self.current_weather(lat, lon, unit)
    current_data = OpenWeatherService.get_weather(lat, lon, unit)[:current]
    data = CurrentWeather.new(current_data)
  end

  def self.daily_weather(lat, lon, unit)
    daily_data = OpenWeatherService.get_weather(lat, lon, unit)[:daily][0..4]
    data = daily_data.map { |day| DailyWeather.new(day) }
  end

  def self.hourly_weather(lat, lon, unit)
    hourly_data = OpenWeatherService.get_weather(lat, lon, unit)[:hourly][0..7]
    data = hourly_data.map { |hour| HourlyWeather.new(hour) }
  end

  def self.road_trip_hourly_weather(lat, lon, unit)
    hourly_data = OpenWeatherService.get_weather(lat, lon, unit)[:hourly]
  end
end
