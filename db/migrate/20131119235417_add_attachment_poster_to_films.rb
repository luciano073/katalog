class AddAttachmentPosterToFilms < ActiveRecord::Migration
  def self.up
    change_table :films do |t|
      t.attachment :poster
    end
  end

  def self.down
    drop_attached_file :films, :poster
  end
end
