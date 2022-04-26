# frozen_string_literal: true

require 'rails_helper'
RSpec.describe UnsplashPhotoService, :vcr do
  context 'class methods' do
    context '#get_photo' do
      it 'returns a photo using location search' do
        location = 'Mexico City'
        search = UnsplashPhotoService.get_background_photo(location)
        expect(search).to be_a Hash
        expect(search[:results]).to be_an Array
        expect(search[:results][0][:urls][:full]).to_not be_nil
      end
    end
  end
end
