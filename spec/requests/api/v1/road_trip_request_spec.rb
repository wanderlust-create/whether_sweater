# frozen_string_literal: true

require 'rails_helper'
RSpec.describe 'Wheather Sweater API', type: :request do
  describe 'index POST api/v1/road_trip' do
    describe 'happy path' do
      it 'returns json request' do
        
        post '/api/v1/forecast?location=denver,co'
        forecast = JSON.parse(response.body, symbolize_names: true)
        expect(response).to be_successful
      end
    end
  end
end
