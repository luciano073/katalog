class Artist < ActiveRecord::Base
	attr_reader :profession_tokens

  before_save :name_normalize
  after_find do
    self.birthday = self.birthday.to_s(:br_date) if self.birthday
    self.death = self.death.to_s(:br_date) if self.death
  end
	
  has_and_belongs_to_many :professions
  has_many :films, :through => :production_team
  has_many :production_team, dependent: :nullify

  mount_uploader :photo, PhotoUploader

  scope :directors, -> { joins(:professions).where(professions: {id: 2})}
  scope :writers, -> { joins(:professions).where(professions: {id: 3})}
  scope :cast, -> { joins(:professions).where(professions: {id: [1, 4]})}
  scope :random, -> {order('random()')} #specific to postgresql


  def profession_tokens=(ids)
    self.profession_ids = ids.split(",")
  end

  def self.search(search)
    if search
      where("i_diacritical(#{self.table_name}.name) ILIKE i_diacritical(?)", "%#{search}%")
    else
      self.all
    end
  end

  protected
  def name_normalize
    self.name = self.name.strip.squeeze(' ').nome_proprio if self.name
    self.real_name = self.real_name.strip.squeeze(' ').nome_proprio if
    self.real_name
  end

end
