class ChangeCompletedOfTweets < ActiveRecord::Migration[6.1]
    def up
      change_column :tweets, :completed, :integer, default: 0
    end
    def down
      change_column :tweets, :completed, :integer
    end
end
