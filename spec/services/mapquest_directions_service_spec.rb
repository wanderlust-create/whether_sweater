# frozen_string_literal: true

require 'rails_helper'
RSpec.describe MapquestDirectionsService, :vcr do
  context 'class methods' do
    context '#get_directions' do
      it 'returns the directions' do
        search = MapquestDirectionsService.get_directions('atlanta', 'denver')
        expect(search).to be_a Hash
        expect(search[:route]).to be_a Hash
      end
    end
  end
end
