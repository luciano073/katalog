class AddGenreToFilms < ActiveRecord::Migration
  def change
    add_column :films, :genre, :string
  end
end
