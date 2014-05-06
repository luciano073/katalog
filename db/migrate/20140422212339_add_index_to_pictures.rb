class AddIndexToPictures < ActiveRecord::Migration
  def change
    change_column :pictures, :imageable_type, :string, limit: 20
    add_index :pictures, [:imageable_type, :imageable_id]
  end
end
