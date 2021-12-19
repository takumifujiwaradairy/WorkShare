class AddColumnToTweets < ActiveRecord::Migration[6.1]
  def change
    add_column :tweets, :user_uid, :string
  end
end
