require 'rails_helper'
RSpec.describe DirectionsFacade, :vcr do
  describe 'class methods' do
    describe '#directions' do
      it 'will return a background photo url' do
        route = DirectionsFacade.directions('Mexico City', 'Houston')
        expect(route).to be_a Directions
        expect(route.travel_time).to_not be_nil
      end
    end
  end
end
