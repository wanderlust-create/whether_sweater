# frozen_string_literal: true

module Api
  module V1
    class BackgroundsController < ApplicationController
      def index
        photo = BackgroundPhotoFacade.photo(params[:location])
        render json: BackgroundPhotoSerializer.new(photo)
      end
    end
  end
end
