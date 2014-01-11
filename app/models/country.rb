class Country < ActiveRecord::Base
  has_many :artists
  has_many :films
  has_many :media, :class_name => "medium"

  mount_uploader :flag, FlagUploader
  # scope :finder, lambda { |q| where("i_diacritical(countries.name) ilike
  # i_diacritical(:q)", q: "%#{q}%") }

  def self.search(search)
    if search
      where("i_diacritical(#{self.table_name}.name) ILIKE i_diacritical(?)", "%#{search}%")
    else
      self.all
    end
  end

  def url_16
    self.flag.url(:_16)
  end
end
