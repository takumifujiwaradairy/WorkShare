# frozen_string_literal: true

class CreateTweets < ActiveRecord::Migration[6.1]
  def change
    create_table :tweets do |t|
      t.string :title
      t.string :tantou
      t.text :body

      t.timestamps
    end
  end
end
