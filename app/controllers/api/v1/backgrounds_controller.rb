module Api
  module V1
    class BackgroundsController < ApplicationController
      def index
        location = params[:location]
        image = BackgroundPhotoFacade.photo(location)
        render json: BackgroundPhotoSerializer.api_format(image, location)
      end
    end
  end
end
