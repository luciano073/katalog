class Country < ActiveRecord::Base
  has_many :artists
  has_many :films
  has_many :media, :class_name => "medium"

  mount_uploader :flag, FlagUploader
  paginates_per 10
  # scope :finder, lambda { |q| where("i_unaccent(countries.name) ilike
  # i_unaccent(:q)", q: "%#{q}%") }

  def self.search(search)
    if search
      where("i_unaccent(#{self.table_name}.name) LIKE i_unaccent(?)", "%#{search}%")
    else
      self.all
    end
  end

  def url_16
    self.flag.url(:_16)
  end
end
