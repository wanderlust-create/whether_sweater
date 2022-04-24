require 'rails_helper'
RSpec.describe ForecastFacade, :vcr do
  describe 'class methods' do
    let(:given_location) {"Staten Island"}
    let(:location) {ForecastFacade.location(given_location)}
    let(:lat) {location.latitude}
    let(:lon) {location.longitude}
    let(:unit) {"metric"}

    describe '#location' do
      it 'will return the locations attributes' do
        location = ForecastFacade.location(given_location)
        expect(location.latitude).to_not be_nil
        expect(location.longitude).to_not be_nil
      end
    end

    describe '#current_weather' do
      it 'will return the current weather' do

        current_weather = ForecastFacade.current_weather(lat, lon, unit)
        expect(current_weather.datetime).to_not be_nil
        expect(current_weather.sunrise).to_not be_nil
        expect(current_weather.sunset).to_not be_nil
        expect(current_weather.temperature).to_not be_nil
        expect(current_weather.feels_like).to_not be_nil
        expect(current_weather.humidity).to_not be_nil
        expect(current_weather.uvi).to_not be_nil
        expect(current_weather.visibility).to_not be_nil
        expect(current_weather.conditions).to_not be_nil
        expect(current_weather.icon).to_not be_nil
      end
    end

    describe '#daily_weather' do
      it 'will return an array of the next 5 days of daily weather data' do
        daily_weather = ForecastFacade.daily_weather(lat, lon, unit)
        expect(daily_weather).to be_an Array
        expect(daily_weather.count).to eq(5)
        current_weather_objects.each do |object|
          expect(object).to be_a DailyWeather
          expect(object.date).to_not be_nil
          expect(object.sunrise).to_not be_nil
          expect(object.sunset).to_not be_nil
          expect(object.max_temp).to_not be_nil
          expect(object.min_temp).to_not be_nil
          expect(object.conditions).to_not be_nil
          expect(object.icon).to_not be_nil
        end
      end
    end

    describe '#hourly_weather' do
      it "will return an array of the next 8 hours of hourly weather data" do
        hourly_weather = ForecastFacade.hourly_weather(lat, lon, unit)
        expect(hourly_weather).to be_an Array
        expect(hourly_weather.count).to eq(8)
        hourly_weather_objects.each do |object|
          expect(object).to be_a HourlyWeather
          expect(object.time).to_not be_nil
          expect(object.temperature).to_not be_nil
          expect(object.conditions).to_not be_nil
          expect(object.icon).to_not be_nil
        end
      end
    end
  end
end
