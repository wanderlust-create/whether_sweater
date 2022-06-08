# frozen_string_literal: true

class YelpSearchService
  def self.get_restaurant(category, location)
    get_url('/v3/businesses/search', category, location)
  end

  def self.get_url(url, category, location)
    conn = Faraday.new(url: 'https://api.yelp.com') do |faraday|
      faraday.headers['Authorization'] = ENV.fetch('YELP_API_KEY', nil)
      faraday.params['term'] = 'restaurants'
      faraday.params['categories'] = category.to_s
      faraday.params['location'] = location.to_s
      faraday.params['limit'] = 1
    end
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
