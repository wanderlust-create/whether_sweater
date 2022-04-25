class Api::V1::MunchiesController < ApplicationController
  def index
    destination = params[:to]
    location = ForecastFacade.location(destination)
    lat = location.latitude
    lon = location.longitude
    directions = DirectionsFacade.directions(params[:from], params[:to])
    current = ForecastFacade.current_weather(lat, lon, params[:unit])
    restaurant = RestaurantFacade.restaurant(params[:categories], destination)
    
    render json: MunchiesSerializer.api_format(destination, directions, current, restaurant)
  end
end
