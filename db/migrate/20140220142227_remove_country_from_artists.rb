class RemoveCountryFromArtists < ActiveRecord::Migration
  def change
    remove_column :artists, :country, :string
  end
end
