# frozen_string_literal: true

class AddTimeToTweets < ActiveRecord::Migration[6.1]
  def change
    add_column :tweets, :time, :date
  end
end
