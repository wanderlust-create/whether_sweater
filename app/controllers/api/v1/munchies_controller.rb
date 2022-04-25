class Api::V1::MunchiesController < ApplicationController
  def index
    destination = params[:to]
    location = ForecastFacade.location(destination)
    lat = location.latitude
    lon = location.longitude
    directions = DirectionsFacade.directions(params[:from], params[:to])
    current = ForecastFacade.current_weather(lat, lon, params[:unit])
    restaurant = 
require "pry"; binding.pry
    render json: DirectionsSerializer.api_format(destination, directions, current)
  end
end
