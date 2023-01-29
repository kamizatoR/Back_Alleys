class DropTableTags < ActiveRecord::Migration[6.1]
  def change
    def change
      drop_table :tags do |t|
        t.string :name, null: false
      end
    end
  end
end
