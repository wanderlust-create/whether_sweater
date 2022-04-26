# frozen_string_literal: true

require 'rails_helper'
RSpec.describe 'Wheather Sweater API', type: :request do
  describe 'index GET /api/v1/backgrounds' do
    describe 'happy path' do
      it 'returns json request' do
        get '/api/v1/backgrounds?location=denver,co'
        background = JSON.parse(response.body, symbolize_names: true)

        expect(response).to be_successful
        expect(background).to be_a Hash

        expect(background).to have_key(:data)
        expect(background[:data]).to be_a Hash

        expect(background[:data]).to have_key(:type)
        expect(background[:data][:type]).to eq('image')

        expect(background[:data]).to have_key(:id)
        expect(background[:data][:id]).to be_a String

        expect(background[:data]).to have_key(:attributes)
        expect(background[:data][:attributes]).to have_key(:image)
        expect(background[:data][:attributes][:image]).to be_a Hash
        expect(background[:data][:attributes][:image]).to have_key(:location)
        expect(background[:data][:attributes][:image][:location]).to be_a String
        expect(background[:data][:attributes][:image]).to have_key(:image_url)
        expect(background[:data][:attributes][:image][:image_url]).to be_a String
        expect(background[:data][:attributes][:image]).to have_key(:credit)
        expect(background[:data][:attributes][:image][:credit]).to have_key(:source)
        expect(background[:data][:attributes][:image][:credit][:source]).to be_a String
        expect(background[:data][:attributes][:image][:credit]).to have_key(:photographer)
        expect(background[:data][:attributes][:image][:credit][:photographer]).to be_a String
        expect(background[:data][:attributes][:image][:credit]).to have_key(:portfolio)
        expect(background[:data][:attributes][:image][:credit][:portfolio]).to be_a String
        expect(background[:data][:attributes][:image][:credit]).to have_key(:"Guidelines and Crediting")
      end
    end
  end
end
