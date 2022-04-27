# frozen_string_literal: true

module Api
  module V1
    class SessionsController < ApplicationController
      def create
        user = User.find_by(email: params[:email])
        if !user
          render json: { error:'Your email and/or password are invalid' }, status: :bad_request
        elsif user&.authenticate(params[:password])
          session[:user_id] = user.id
          render json: UsersSerializer.api_format(user), status: 201
        elsif !user.authenticate(params[:password])
          render json: { error:'Your email and/or password are invalid' }, status: :bad_request
        end
      end
    end
  end
end
