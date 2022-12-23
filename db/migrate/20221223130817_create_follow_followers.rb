class CreateFollowFollowers < ActiveRecord::Migration[6.1]
  def change
    create_table :follow_followers do |t|

      t.timestamps
    end
  end
end
