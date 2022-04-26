# frozen_string_literal: true

module Api
  module V1
    class RoadTripController < ApplicationController
      before_action :authenticate
      def create
        origin = params[:origin]
        destination = params[:destination]
        unit = 'imperial'
        time = DirectionsFacade.directions(origin, destination)
          if time.class == String
            render json: { error: 'impossible route' }, status: 401
          else
        eta = time.eta_time
        destination_location = ForecastFacade.location(destination)
        lat = destination_location.latitude
        lon = destination_location.longitude
        weather = ForecastFacade.road_trip_hourly_weather(lat, lon, unit)
        eta_weather = weather[eta]
        render json: RoadTripSerializer.api_format(origin, destination, time, eta_weather), status: 201
      end
    end

      private

      def authenticate
        user = User.find_by(api_key: params[:api_key])
        if !user
         render json: { error: 'Invalid API key' }, status: 401
        end
      end
    end
  end
end
