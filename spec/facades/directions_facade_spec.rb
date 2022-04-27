# frozen_string_literal: true

require 'rails_helper'
RSpec.describe DirectionsFacade, :vcr do
  describe 'class methods' do
    describe '#directions happy path' do
      it 'will return a directions' do
        route = DirectionsFacade.directions('Mexico City', 'Houston')
        expect(route).to be_a Directions
        expect(route.travel_time).to_not be_nil
      end
    end

    describe '#directions sad path' do
      it 'will return an error message if route is not possible' do
        route = DirectionsFacade.directions('Mexico City', 'London')
        expect(route).to eq('impossible route')
      end
    end
  end
end
