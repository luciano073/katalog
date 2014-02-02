class Artist < ActiveRecord::Base
  # include ActionView::Helpers::DateHelper
	attr_reader :profession_tokens

  before_save :name_normalize
  after_find do
    self.birthday = I18n.l self.birthday if self.birthday
    self.death = I18n.l self.death if self.death
  end
	
  has_and_belongs_to_many :professions
  has_many                :films, :through => :production_team
  has_many                :production_team, dependent: :nullify
  belongs_to              :country

  mount_uploader :photo, PhotoUploader

  scope :directors, -> { joins(:professions).where(professions: {id: 2})}
  scope :writers,   -> { joins(:professions).where(professions: {id: 3})}
  scope :cast,      -> { joins(:professions).where(professions: {id: [1, 4]})}
  scope :random,    -> {order('random()')} #specific to postgresql


  def profession_tokens=(ids)
    self.profession_ids = ids.split(",")
  end

  def age
    diff = 0
    if self.birthday && !self.death
      # distance_of_time_in_words(self.birthday, Date.today)
      diff = Date.today - self.birthday
    end
    if self.birthday and self.death
      # distance_of_time_in_words(self.birthday, self.death)
      diff = self.death - self.birthday
    end
    years, rest = diff.abs.divmod(365.25)
    months = rest / 30 if rest > 0
    age = "#{years} ano#{"s" if years > 1}"
    if months and months > 1       
      age << " e #{months.to_i} mês" if months < 2
      age << " e #{months.to_i} meses" if months > 2
    end
    return age   
      
  end

  def self.search(search)
    if search
      where("i_unaccent(#{self.table_name}.name) LIKE i_unaccent(?)", "%#{search}%")
    else
      self.all
    end
  end

  protected
  def name_normalize
    re = /\s+[ixv]{,3}\z/i # for names ends with II, III and so on
    if self.name
      str = self.name.strip.squeeze(' ').nome_proprio
      str =~ re
      self.name = str.sub(re, $~.to_s.upcase)      
    end

    if self.real_name
      str = self.real_name.strip.squeeze(' ').nome_proprio
      str =~ re
      self.real_name = str.sub(re, $~.to_s.upcase)
    end
    
  end

end
