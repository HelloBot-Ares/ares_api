class User < ApplicationRecord
  validates :username, :password, :city, presence: true
  validates :username, uniqueness: true
  validate :telegram_id_uniqueness

  has_many :user_topics
  has_many :topics, through: :user_topics
  has_many :event_participants
  has_many :events, through: :event_participants

  def telegram_id_uniqueness
    return unless telegram_id
    return if telegram_id.empty?
    if User.where(telegram_id: telegram_id).any?
      errors.add(:base, "Telegram ID already taken")
    end
  end
end
