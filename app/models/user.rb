class User < ApplicationRecord
  validates :username, :password, :city, presence: true
  validates :username, uniqueness: true

  has_many :user_topics
  has_many :topics, through: :user_topics

  has_many :event_participants
  has_many :events, through: :event_participants
end
