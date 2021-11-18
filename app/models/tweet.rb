class Tweet < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :tantou, presence: true
  enum completed: { outstanding: 0, in_progress: 1, closed: 2 }
end
