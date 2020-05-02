# frozen_string_literal: true

class User < ApplicationRecord
  validates :email, uniqueness: true
  validates_format_of :email, with: /@/
  validates :password_digest, presence: true
  has_secure_password

  def generate_temp_token
    self.token = "#{SecureRandom.hex(10)}#{id}"
    save
    token
  end
end
