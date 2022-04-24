class Api::V1::ForecastController < ApplicationController
  def index
    location = ForecastFacade.location(params[:given_location])
    lat = location.latitude
    lon = location.longitude

    current = ForecastFacade.current_weather(lat, lon, params[:unit])
    daily = ForecastFacade.daily_weather(lat, lon, params[:unit])
    hourly = ForecastFacade.hourly_weather(lat, lon, params[:unit])
    render json: ForecastSerializer.api_format(lat, lon, current, daily, hourly)
  end
end
