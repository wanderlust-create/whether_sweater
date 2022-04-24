class OpenWeatherService

  def self.get_weather(lat, lon, unit)
    get_url("/data/2.5/onecall", lat, lon, unit)
  end

  private

  def self.get_url(url, lat, lon, unit = metric)
    conn = Faraday.new(url: "https://api.openweathermap.org") do |faraday|
      faraday.params['appid'] = ENV['open_key']
      faraday.params['lat'] = "#{lat}"
      faraday.params['lon'] = "#{lon}"
      faraday.params['exclude'] = "minutely, alerts"
      faraday.params['units'] = "#{unit}"
    end

    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
