# frozen_string_literal: true

module Authenticable
  def current_user
    return @current_user if @current_user

    header = request.headers['Authorization']
    return nil if header.nil?

    decoded = JsonWebToken.decode(header)
    @current_user = User.find_by(session_token: decoded[:session_token])
  rescue ActiveRecord::RecordNotFound
  end

  def authenticate_user!
    head :forbidden unless @user.id == current_user&.id
  end
end
