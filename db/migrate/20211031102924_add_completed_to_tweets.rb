class AddCompletedToTweets < ActiveRecord::Migration[6.1]
  def change
    add_column :tweets, :completed, :integer
  end
end
