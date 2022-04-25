class UnsplashPhotoService

  def self.get_background_photo(location)
    get_url("/search/photos/", location)
  end

  def self.get_url(url, location)
    conn = Faraday.new(url: "https://api.unsplash.com") do |faraday|
      faraday.params['client_id'] = ENV['un_ac']
      faraday.params['query'] = location + "landscape"
      faraday.params['orientation'] = "landscape"
      faraday.params['page'] = 1
      faraday.params['per_page'] = 1
    end
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
