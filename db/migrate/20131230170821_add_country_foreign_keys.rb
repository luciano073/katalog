class AddCountryForeignKeys < ActiveRecord::Migration
  def change
    add_column :artists, :country_id, :integer
    add_column :films, :country_id, :integer
    add_column :media, :country_id, :integer
  end
end
