class Api::V1::BackgroundController < ApplicationController
  def index
    photo = BackgroundPhotoFacade.photo(params[:location])
    render json: BackgroundPhotoSerializer.new(photo)
  end
end
