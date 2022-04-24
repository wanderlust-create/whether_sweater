require 'rails_helper'
RSpec.describe OpenWeatherService, :vcr do
  context 'class methods' do
    context '#get_weather' do
      it 'returns the weather for a requested city' do
        lat = 33.748547
        lon = -84.391502
        unit = 'metric'

        search = OpenWeatherService.get_weather(lat, lon, unit)
        expect(search).to be_a Hash
        expect(search.keys).to eq(%i[lat lon timezone timezone_offset current hourly daily])
        expect(search[:current]).to be_a Hash
        expect(search[:hourly]).to be_an Array
        expect(search[:daily]).to be_an Array
      end
    end
  end
end
