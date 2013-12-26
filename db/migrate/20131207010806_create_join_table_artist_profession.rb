class CreateJoinTableArtistProfession < ActiveRecord::Migration
  def change
    create_join_table :artists, :professions do |t|
      t.index [:artist_id, :profession_id]
      t.index [:profession_id, :artist_id]
    end
  end
end
