require 'rails_helper'
RSpec.describe YelpSearchService, :vcr do
  context 'class methods' do
    context '#get_restaurant_search' do
            it 'returns a specific type of restaurant' do

              search = YelpSearchService.get_restaurant('cafe', 'Atlanta, GA')
              expect(search).to be_a Hash
              expect(search[:businesses]).to be_an Array
            end
          end
        end
      end
