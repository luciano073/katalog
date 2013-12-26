class CreateFilms < ActiveRecord::Migration
  def change
    create_table :films do |t|
      t.string :title
      t.string :brazilian_title
      t.date :release
      t.text :synopse

      t.timestamps
    end
  end
end
