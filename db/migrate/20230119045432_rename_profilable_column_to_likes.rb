class RenameProfilableColumnToLikes < ActiveRecord::Migration[6.1]
  def change
    rename_column :likes, :profilable_type, :table_type
    rename_column :likes, :profilable_id, :table_id
    rename_column :likes, :end_user_id, :end_user_id, null: false

  end
end
