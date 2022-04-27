# frozen_string_literal: true

require 'rails_helper'
RSpec.describe 'Wheather Sweater API', type: :request do
  describe 'POST /api/v1/sessions' do
    before :each do
      User.destroy_all
    end

    describe 'happy path' do
      it 'signs in a new user and creates a session' do
        data = {
          "email": 'whatever@example.com',
          "password": 'password',
          "password_confirmation": 'password'
        }
        headers = { 'Content-Type' => 'application/json', 'Accept' => 'application/json' }
        post '/api/v1/users', headers: headers, params: JSON.generate(data)
        new_user = User.last

        session_data = {
          "email": 'whatever@example.com',
          "password": 'password'
        }
        headers = { 'Content-Type' => 'application/json', 'Accept' => 'application/json' }
        post '/api/v1/sessions', headers: headers, params: JSON.generate(session_data)
        session = JSON.parse(response.body, symbolize_names: true)

        expect(response).to be_successful
        expect(session).to be_a Hash
        expect(session).to have_key(:data)
        expect(session[:data]).to have_key(:type)
        expect(session[:data][:type]).to eq('users')
        expect(session[:data]).to have_key(:id)
        expect(session[:data][:id]).to be_an Integer

        expect(session[:data]).to have_key(:attributes)
        expect(session[:data][:attributes]).to have_key(:email)
        expect(session[:data][:attributes][:email]).to be_a String
        expect(session[:data][:attributes]).to have_key(:api_key)
        expect(session[:data][:attributes][:api_key]).to be_a String
      end
    end

    describe 'sad paths' do
      it 'returns a json error if authentication fails' do
        data = {
          "email": 'whatever@example.com',
          "password": 'password',
          "password_confirmation": 'password'
        }
        headers = { 'Content-Type' => 'application/json', 'Accept' => 'application/json' }
        post '/api/v1/users', headers: headers, params: JSON.generate(data)
        new_user = User.last

        session_data = {
          "email": 'whatever@example.com',
          "password": 'password1'
        }
        headers = { 'Content-Type' => 'application/json', 'Accept' => 'application/json' }
        post '/api/v1/sessions', headers: headers, params: JSON.generate(session_data)
        expect(response.status).to eq(400)
        expect(response.body).to eq("{\"error\":\"Your email and/or password are invalid\"}")
      end

      it 'returns a json error if account does not exist' do
        data = {
          "email": 'whatever@example.com',
          "password": 'password',
          "password_confirmation": 'password'
        }
        headers = { 'Content-Type' => 'application/json', 'Accept' => 'application/json' }
        post '/api/v1/users', headers: headers, params: JSON.generate(data)
        new_user = User.last

        session_data = {
          "email": 'whatever1@example.com',
          "password": 'password'
        }
        headers = { 'Content-Type' => 'application/json', 'Accept' => 'application/json' }
        post '/api/v1/sessions', headers: headers, params: JSON.generate(session_data)
        expect(response.status).to eq(400)
        expect(response.body).to eq("{\"error\":\"Account does not exist\"}")
      end
    end
  end
end
