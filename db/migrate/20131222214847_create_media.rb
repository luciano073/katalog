class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.string :type
      t.date :release_date
      t.string :pakage
      t.integer :qtd_discs
      t.decimal :price, precision: 5, scale: 2
      t.string :art
      t.string :distribuidora

      t.timestamps
    end
  end
end
