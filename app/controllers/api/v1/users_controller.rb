# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      def create
        user = User.create(user_params)
        if user.save
          api_key = user.api_keys.create! token: SecureRandom.hex
          user.update!(api_key: api_key.token)
          render json: UsersSerializer.api_format(user), status: 201
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
