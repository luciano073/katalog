class AddAttachmentPhotoToArtists < ActiveRecord::Migration
  def self.up
    change_table :artists do |t|
      t.attachment :photo
    end
  end

  def self.down
    drop_attached_file :artists, :photo
  end
end
