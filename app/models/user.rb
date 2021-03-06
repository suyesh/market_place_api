# frozen_string_literal: true

class User < ApplicationRecord
  validates :email, uniqueness: true
  validates_format_of :email, with: /@/
  validates :password_digest, presence: true
  has_secure_password

  def generate_session_token
    self.session_token = "#{SecureRandom.hex(10)}#{id}"
    save
    session_token
  end
end
