# frozen_string_literal: true

require 'rails_helper'
RSpec.describe RestaurantFacade, :vcr do
  describe 'class methods' do
    describe '#restaurant' do
      it 'will return a restaurant' do
        eat = RestaurantFacade.restaurant('bar', 'Savannah, GA')
        expect(eat).to be_a Restaurant
        expect(eat.name).to_not be_nil
        expect(eat.address).to_not be_nil
      end
    end
  end
end
