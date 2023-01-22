class ChangeColumnToLikes < ActiveRecord::Migration[6.1]
  def change
    change_column_default(:likes, :end_user_id, to: "nul")
  end
end
