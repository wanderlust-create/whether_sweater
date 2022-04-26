class Api::V1::BackgroundsController < ApplicationController
  def index
    location = params[:location]
    image = BackgroundPhotoFacade.photo(location)
    render json: BackgroundPhotoSerializer.api_format(image, location)
  end
end
