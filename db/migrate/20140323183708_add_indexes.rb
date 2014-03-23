class AddIndexes < ActiveRecord::Migration
  def change
    add_index :films, :brazilian_title
    add_index :artists, :name
  end
end
