# frozen_string_literal: true

class Api::V1::TokensController < ApplicationController
  def create
    @user = User.find_by_email(user_params[:email])
    if @user&.authenticate(user_params[:password])
      render json: {
        token: JsonWebToken.encode(session_token: @user.generate_session_token),
        email: @user.email
      }
    else
      head :unauthorized
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
