# frozen_string_literal: true

module Api
  module V1
    class ForecastController < ApplicationController
      def index
        location = ForecastFacade.location(params[:location])
        lat = location.latitude
        lon = location.longitude

        current = ForecastFacade.current_weather(lat, lon, params[:unit])
        daily = ForecastFacade.daily_weather(lat, lon, params[:unit])
        hourly = ForecastFacade.hourly_weather(lat, lon, params[:unit])
        render json: ForecastSerializer.api_format(current, daily, hourly)
      end
    end
  end
end
