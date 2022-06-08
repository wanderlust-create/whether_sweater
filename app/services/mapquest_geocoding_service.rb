# frozen_string_literal: true

class MapquestGeocodingService
  def self.get_lat_lon(location)
    get_url("/geocoding/v1/address?key=#{ENV.fetch('map_key', nil)}&location=#{location}")
  end

  def self.get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: 'http://www.mapquestapi.com')
  end
end
