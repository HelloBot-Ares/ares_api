class Topic < ApplicationRecord
  has_many :user_topics
  has_many :users, through: :user_topics
end
