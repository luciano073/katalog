class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.references :film, index: true
      t.references :artist, index: true
      t.boolean :cast, default: false
      t.boolean :writer, default: false
      t.boolean :director, default: false

      t.timestamps
    end
  end
end
