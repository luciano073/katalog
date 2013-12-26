class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name
      t.string :real_name
      t.date :birthday
      t.date :death
      t.string :photo
      t.string :height

      t.timestamps
    end
  end
end
