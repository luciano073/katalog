class RemovePhotocolumnsFromArtists < ActiveRecord::Migration
  def change
    remove_column :artists, :photo_file_name, :string
    remove_column :artists, :photo_content_type, :string
    remove_column :artists, :photo_file_size, :integer
    remove_column :artists, :photo_updated_at, :datetime
  end
end
