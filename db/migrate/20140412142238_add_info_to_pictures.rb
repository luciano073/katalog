class AddInfoToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :info, :string
  end
end
