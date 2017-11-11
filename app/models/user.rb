class User < ApplicationRecord
  validates :username, :password, :city, presence: true
  validates :username, uniqueness: true
end
