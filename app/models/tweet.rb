class Tweet < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :tantou, presence: true
end
