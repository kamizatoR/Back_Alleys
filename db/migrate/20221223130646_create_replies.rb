class CreateReplies < ActiveRecord::Migration[6.1]
  def change
    create_table :replies do |t|

      t.timestamps
      t.integer :end_user_id, null: false
      t.integer :comment_id, null: false
      t.string :body, null: false
    end
  end
end
