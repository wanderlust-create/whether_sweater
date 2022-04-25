require 'rails_helper'
RSpec.describe Restaurant do
  it 'exists with attributes' do
    restaurant_data = {
      "businesses": [
        {
          "id": 'U-i6cq-yFRVJC4pIKSLX9Q',
          "alias": 'poor-calvins-atlanta-15',
          "name": "Poor Calvin's",
          "image_url": 'https://s3-media3.fl.yelpcdn.com/bphoto/OqNT3uMiq-ZvhkPmJz_2eA/o.jpg',
          "is_closed": false,
          "url": 'https://www.yelp.com/biz/poor-calvins-atlanta-15?adjust_creative=agvJk9coBmymQXFjKp3MKA&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=agvJk9coBmymQXFjKp3MKA',
          "review_count": 3850,
          "rating": 4.5,
          "coordinates": {
            "latitude": 33.7684,
            "longitude": -84.38226
          },
          "transactions": %w[
            delivery
            pickup
          ],
          "price": '$$$',
          "location": {
            "address1": '510 Piedmont Ave NE',
            "address3": '',
            "city": 'Atlanta',
            "zip_code": '30308',
            "country": 'US',
            "state": 'GA',
            "display_address": [
              '510 Piedmont Ave NE',
              'Atlanta, GA 30308'
            ]
          },
          "phone": '+14042544051',
          "display_phone": '(404) 254-4051',
          "distance": 5038.783352167851
        }
      ]
    }
    restaurant = Restaurant.new(restaurant_data)

    expect(restaurant).to be_a Restaurant
    expect(restaurant.name).to eq("Poor Calvin's")
    expect(restaurant.address).to eq('510 Piedmont Ave NE Atlanta, GA 30308')
  end
end
