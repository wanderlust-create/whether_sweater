# frozen_string_literal: true

require 'rails_helper'
RSpec.describe 'Wheather Sweater API', type: :request do
  describe 'POST /api/v1/users' do
    before :each do
      User.destroy_all
    end
    describe 'happy path' do
      it 'creates a user' do
        data = {
          "email": 'whatever@example.com',
          "password": 'password',
          "password_confirmation": 'password'
        }
        headers = { 'Content-Type' => 'application/json', 'Accept' => 'application/json' }
        post '/api/v1/users', headers: headers, params: JSON.generate(data)

        new_user = User.last
        expect(response).to be_successful
        expect(new_user.email).to eq(data[:email])
        expect(new_user.password_digest).to be_a String
        expect(new_user.api_key).to be_a String
      end
    end

    describe 'sad path' do
      it 'returns an error if information is missing' do
        data = {
          "email": 'whatever2@example.com',
          "password": 'password2'
        }
        headers = { 'Content-Type' => 'application/json', 'Accept' => 'application/json' }
        post '/api/v1/users', headers: headers, params: JSON.generate(data)

        new_user = User.last
        expect(response.status).to eq(400)
        expect(response.body).to eq("{\"error\":\"You need an email, password, and password_confirmation to create an account\"}")
      end
      it 'returns an error if authentication fails' do
        data = {
          "email": 'whatever@example.com',
          "password": 'password',
          "password_confirmation": 'another password'
        }
        headers = { 'Content-Type' => 'application/json', 'Accept' => 'application/json' }
        post '/api/v1/users', headers: headers, params: JSON.generate(data)

        expect(response.status).to eq(400)
        expect(response.body).to eq("Password confirmation doesn't match Password")
      end
    end
  end
end
