# frozen_string_literal: true

require 'rails_helper'
RSpec.describe 'Wheather Sweater API', type: :request do
  describe 'POST api/v1/road_trip' do
    describe 'happy path' do
      it 'returns json request' do
        User.destroy_all
        user1_data = {
          "email": 'whatever@example.com',
          "password": 'password',
          "password_confirmation": 'password'
        }
        headers = { 'Content-Type' => 'application/json', 'Accept' => 'application/json' }
        post '/api/v1/users', headers: headers, params: JSON.generate(user1_data)

        user1 = User.last
        trip_data = {
          "origin": 'Denver,CO',
          "destination": 'Pueblo,CO',
          "api_key": user1.api_key
        }
        headers = { 'Content-Type' => 'application/json', 'Accept' => 'application/json' }
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

    describe 'sad path' do
      it 'returns json error if incormation is missing' do
        User.destroy_all
        user2_data = {
          "email": 'lama@example.com',
          "password": 'happy1',
          "password_confirmation": 'happy1'
        }
        headers = { 'Content-Type' => 'application/json', 'Accept' => 'application/json' }
        post '/api/v1/users', headers: headers, params: JSON.generate(user2_data)

        user2 = User.last
        trip_data = {
          "origin": 'Denver,CO',
          "api_key": user2.api_key
        }
        headers = { 'Content-Type' => 'application/json', 'Accept' => 'application/json' }
        post '/api/v1/road_trip', headers: headers, params: JSON.generate(trip_data)
        expect(response.status).to eq(401)
        expect(response.body).to eq('You need api_key, origin, & destination params to make a sucessful request')
      end
      it 'returns json error if route is impossible' do
        User.destroy_all
        user3_data = {
          "email": 'frog@example.com',
          "password": 'happy1',
          "password_confirmation": 'happy1'
        }
        headers = { 'Content-Type' => 'application/json', 'Accept' => 'application/json' }
        post '/api/v1/users', headers: headers, params: JSON.generate(user3_data)

        user3 = User.last
        trip_data = {
          "origin": 'Denver,CO',
          "destination": 'London',
          "api_key": user3.api_key
        }
        headers = { 'Content-Type' => 'application/json', 'Accept' => 'application/json' }
        post '/api/v1/road_trip', headers: headers, params: JSON.generate(trip_data)
        expect(response.status).to eq(201)
        trip = JSON.parse(response.body, symbolize_names: true)
        expect(trip[:data][:attributes][:travel_time]).to eq('impossible route')
        expect(trip[:data][:attributes][:weather_at_eta][:temperature]).to eq('')
        expect(trip[:data][:attributes][:weather_at_eta][:conditions]).to eq('')
      end

      it 'returns json error if API key is invalid' do
        User.destroy_all
        user4_data = {
          "email": 'dog@example.com',
          "password": 'happy1',
          "password_confirmation": 'happy1'
        }
        headers = { 'Content-Type' => 'application/json', 'Accept' => 'application/json' }
        post '/api/v1/users', headers: headers, params: JSON.generate(user4_data)

        user4 = User.last
        trip_data = {
          "origin": 'Denver,CO',
          "destination": 'London',
          "api_key": '12345'
        }
        headers = { 'Content-Type' => 'application/json', 'Accept' => 'application/json' }
        post '/api/v1/road_trip', headers: headers, params: JSON.generate(trip_data)
        expect(response.status).to eq(401)
        expect(response.body).to eq('Invalid API key')
      end
    end
  end
end
