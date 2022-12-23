class CreateTagRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :tag_relations do |t|

      t.timestamps
      t.integer :post_id, null: false
      t.integer :tag_id, null: false
      
    end
  end
end
