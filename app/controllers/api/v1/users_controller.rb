module Api
  module V1
    class UsersController < ApplicationController
      def create
        user = User.create(user_params)
        if user.save
          render json: { message: 'account created' }, status: 201
        else
          render json: { error: user.errors.full_messages.to_sentence }, status: :bad_request
        end
      end
      private
      def user_params
        params.permit(:email, :password, :password_confirmation)
      end
    end
  end
end
