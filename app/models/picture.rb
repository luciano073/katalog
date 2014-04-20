class Picture < ActiveRecord::Base
  belongs_to :imageable, polymorphic: true
  mount_uploader :image, ImageUploader

  before_create :default_name

    def default_name
      self.info ||= File.basename(image.filename, '.*').titlecase if image
    end
end
