require 'rails_helper'
RSpec.describe YelpService, :vcr do
  context 'class methods' do
    context '#get_restaurant_search' do
            it 'returns a specific type of restaurant' do
              categories = 'cafe'
              location = 'atlanta'
              search = YelpService.get_restaurant(categories, location)
              expect(search).to be_a Hash
              expect(search[:businesses]).to be_an Array
            end
          end
        end
      end
