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
        expect(background[:data]).to have_key(:id)
        expect(background[:data][:id]).to be_a String

        expect(background[:data]).to have_key(:type)
        expect(background[:data][:type]).to eq("background_photo")
        
        expect(background[:data]).to have_key(:attributes)
        expect(background[:data][:attributes]).to have_key(:url)
        expect(background[:data][:attributes][:url]).to be_a String
        expect(background[:data][:attributes]).to have_key(:artist)
        expect(background[:data][:attributes][:artist]).to be_a String
        expect(background[:data][:attributes]).to have_key(:portfolio)
        expect(background[:data][:attributes][:portfolio]).to be_a String
      end
    end
  end
end
