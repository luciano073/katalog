class DropJoinTableCast < ActiveRecord::Migration
  def change
    drop_join_table :films, :artists, table_name: "Cast" do |t|
      # t.index [:film_id, :artist_id]
      # t.index [:artist_id, :film_id]
    end
  end
end
