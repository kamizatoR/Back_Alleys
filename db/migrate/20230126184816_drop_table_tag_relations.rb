class DropTableTagRelations < ActiveRecord::Migration[6.1]
  def change
    def change
      drop_table :tag_relations do |t|
        t.integer :post_id, null: false
        t.integer :tag_id, null: false
      end
    end
  end
end
