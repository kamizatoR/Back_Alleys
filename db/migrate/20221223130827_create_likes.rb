class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|

      t.timestamps
      t.references :profilable, polymorphic: true, null: false
    end
  end
end
