# frozen_string_literal: true

class User < ApplicationRecord
  has_many :api_keys, as: :bearer, dependent: :destroy
  validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :password_digest, presence: true
  has_secure_password
end
