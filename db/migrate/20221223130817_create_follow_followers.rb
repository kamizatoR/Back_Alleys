class CreateFollowFollowers < ActiveRecord::Migration[6.1]
  def change
    create_table :follow_followers do |t|

      t.timestamps
      t.references :follower, null: false, foreign_key: { to_table: :end_users }
      t.references :followed, null: false, foreign_key: { to_table: :end_users }
    end
  end
end
