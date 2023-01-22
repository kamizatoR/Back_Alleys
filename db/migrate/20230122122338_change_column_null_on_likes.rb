class ChangeColumnNullOnLikes < ActiveRecord::Migration[6.1]
  def change
    change_column_null :likes, :end_user_id, false
  end
end
