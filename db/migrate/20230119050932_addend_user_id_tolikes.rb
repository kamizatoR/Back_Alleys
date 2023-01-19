class AddendUserIdTolikes < ActiveRecord::Migration[6.1]
  def change
    add_column :likes, :end_user_id, :integer
  end
end
