class RemovePosterFromFilm < ActiveRecord::Migration
  def change
    remove_column :films, :poster_file_name, :string
    remove_column :films, :poster_content_type, :string
    remove_column :films, :poster_file_size, :integer
    remove_column :films, :poster_updated_at, :datetime
  end
end
