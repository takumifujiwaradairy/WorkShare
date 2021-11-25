class Tweet < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  has_many :comments, dependent: :destroy
  validates :title, presence: true
  validates :tantou, presence: true
  enum completed: { outstanding: 0, in_progress: 1, closed: 2 }
end
