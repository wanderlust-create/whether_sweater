class Api::V1::MunchiesController < ApplicationController
  def index
    destination = params[:destination]
    location = ForecastFacade.location(destination)
    lat = location.latitude
    lon = location.longitude
    directions = DirectionsFacade.directions(params[:start], params[:destination])
    current = ForecastFacade.current_weather(lat, lon, params[:unit])
    restaurant = RestaurantFacade.restaurant(params[:food], destination)

    render json: MunchiesSerializer.api_format(destination, directions, current, restaurant)
  end
end
