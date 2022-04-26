# frozen_string_literal: true

require 'rails_helper'
RSpec.describe MapquestGeocodingService, :vcr do
  context 'class methods' do
    context '#get_lat_lon' do
      it 'returns the latitude and longitude for a requested city' do
        search = MapquestGeocodingService.get_lat_lon('atlanta')
        expect(search).to be_a Hash
        expect(search[:results]).to be_an Array
        expect(search[:results][0][:locations]).to be_an Array
        expect(search[:results][0][:locations][0][:displayLatLng]).to be_a Hash
        expect(search[:results][0][:locations][0][:adminArea5]).to_not be_nil
        expect(search[:results][0][:locations][0][:adminArea3]).to_not be_nil
        expect(search[:results][0][:locations][0][:adminArea1]).to_not be_nil
        expect(search[:results][0][:locations][0][:displayLatLng][:lat]).to_not be_nil
        expect(search[:results][0][:locations][0][:displayLatLng][:lng]).to_not be_nil
      end
    end
  end
end
