class AddColumnLengthToFilm < ActiveRecord::Migration
  def change
    add_column :films, :length, :string
  end
end
