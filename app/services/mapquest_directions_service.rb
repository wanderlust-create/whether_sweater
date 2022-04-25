class MapquestDirectionsService
  def self.get_directions(from, to)
    get_url("/directions/v2/route?key=#{ENV['map_key']}&from=#{from}&to=#{to}")
  end

  def self.get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: 'http://www.mapquestapi.com')
  end
end
