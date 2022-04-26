# frozen_string_literal: true

require 'rails_helper'
RSpec.describe 'Wheather Sweater API', type: :request do
  describe 'POST api/v1/road_trip' do
    before :each do
      User.destroy_all
    end
    describe 'happy path' do
      it 'returns json request' do
        user_data = {
          "email": "whatever@example.com",
          "password": "password",
          "password_confirmation": "password"
        }
        headers = {'Content-Type' => 'application/json', 'Accept' => 'application/json'}
        post '/api/v1/users', headers: headers, params: JSON.generate(user_data)

        user = User.last
        trip_data = {
          "origin": "Denver,CO",
          "destination": "Pueblo,CO",
          "api_key": user.api_key
        }
        headers = {'Content-Type' => 'application/json', 'Accept' => 'application/json'}
        post '/api/v1/road_trip', headers: headers, params: JSON.generate(trip_data)
        trip = JSON.parse(response.body, symbolize_names: true)

        expect(response).to be_successful
        expect(trip).to be_a Hash
        expect(trip).to have_key(:data)
        expect(trip[:data]).to have_key(:id)
        expect(trip[:data][:id]).to be_nil
        expect(trip[:data]).to have_key(:type)
        expect(trip[:data][:type]).to eq('roadtrip')
        expect(trip[:data]).to have_key(:attributes)
        expect(trip[:data][:attributes]).to have_key(:start_city)
        expect(trip[:data][:attributes][:start_city]).to be_a String
        expect(trip[:data][:attributes]).to have_key(:end_city)
        expect(trip[:data][:attributes][:end_city]).to be_a String
        expect(trip[:data][:attributes]).to have_key(:travel_time)
        expect(trip[:data][:attributes][:travel_time]).to be_a String
        expect(trip[:data][:attributes]).to have_key(:weather_at_eta)
        expect(trip[:data][:attributes][:weather_at_eta]).to have_key(:temperature)
        expect(trip[:data][:attributes][:weather_at_eta][:temperature]).to be_a(Float).or be_a(Integer)
        expect(trip[:data][:attributes][:weather_at_eta]).to have_key(:conditions)
        expect(trip[:data][:attributes][:weather_at_eta][:conditions]).to be_a String
      end
    end
  end
end
