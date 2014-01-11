class Film < ActiveRecord::Base
  attr_reader :cast_tokens
  attr_reader :director_tokens
  attr_reader :writer_tokens
  attr_reader :poster_cache
  attr_accessor :cast_ids, :writer_ids, :director_ids
  attr_accessor :cast_has_changed, :writers_has_changed, :directors_has_changed
  # @cast_has_changed, @writers_has_changed, @directors_has_changed = false
  
  after_initialize do
    self.release = self.release.to_s(:br_date) if self.release
    self.cast_ids ||= self.cast.map(&:id)
    self.writer_ids ||= self.writers.map(&:id)
    self.director_ids ||= self.directors.map(&:id)
    self.cast_has_changed = false
    self.writers_has_changed = false
    self.directors_has_changed = false
    
    if self.new_record?
      self.cast_has_changed = true
      self.writers_has_changed = true
      self.directors_has_changed = true
      self.cast_ids = []
      self.director_ids = []
      self.writer_ids = []
    end
    
    if not self.artist_ids.empty? and self.cast.empty? and self.writers.empty? and self.directors.empty?
      self.cast_ids += self.artist_ids      
    end
  end

  before_save :set_production_team, on: [:create, :update], if: :production_team_has_changed?
  # before_save :set_production_team, on: [:create, :update], if: :writers_has_changed?
  # before_save :set_production_team, on: [:create, :update], if: :directors_has_changed?
  before_save :bd_title, on: [:create, :update]

  mount_uploader :poster, PosterUploader #Gem carrierwave
  has_many       :production_team, dependent: :destroy
  has_many       :artists, :through => :production_team
  belongs_to :country


  # has_and_belongs_to_many :prizes, :join_table => "PrizeEdition"
  # has_and_belongs_to_many :media

  scope :random, -> {order('random()')}

  
  def cast
    self.production_team.map { |e| e.artist if e.cast? }.compact
    # cast.map(&:name).join(", ") unless cast.empty?
  end

  def directors
    self.production_team.map { |e| e.artist if e.director? }.compact
    # directors.map(&:name).join(", ") unless directors.empty?
  end

  def writers
    self.production_team.map { |e| e.artist if e.writer? }.compact
    # writers.map(&:name).join(", ") unless writers.empty?
  end

  def production_team_has_changed?
    if self.cast_has_changed or self.writers_has_changed or self.directors_has_changed
      return true
    else
      return false
    end
  end

  def cast_tokens=(ids)
    unless self.new_record?
      unless self.cast_ids.map { |e| e.to_s } == ids.split(",")
        self.cast_has_changed = true    
      end
    end
    self.cast_ids = ids.split(",")
  end

  def director_tokens=(ids)
    unless self.new_record?
      unless self.director_ids.map { |e| e.to_s } == ids.split(",")
        self.directors_has_changed = true
      end
    end
    self.director_ids = ids.split(",")
  end

  def writer_tokens=(ids)
    unless self.new_record?  
      unless self.writer_ids.map { |e| e.to_s } == ids.split(",")
        self.writers_has_changed = true    
      end
    end
    self.writer_ids = ids.split(",")
  end

  def self.search(search)
    if search
      where('i_diacritical(films.brazilian_title) ILIKE i_diacritical(?)', "%#{search}%")
    else
      self.all
    end
  end

  
  protected

  
  def set_production_team
    self.production_team.clear unless self.new_record?
    unless self.director_ids.empty?      
      self.director_ids.each do |d|
        self.production_team.build(artist_id: d.to_i, director: true)
      end
    end

    unless self.writer_ids.empty?
      self.writer_ids.each do |w|
        self.production_team.build(artist_id: w.to_i, writer: true)
      end
    end

    unless self.cast_ids.empty?
      self.cast_ids.each do |c|
        self.production_team.build(artist_id: c.to_i, cast: true)
      end
    end
  end

  def bd_title
    # re = /^[ao]s?n?\s+|^the\s+|^u[mn]a?s?\s+/i
    re = Regexp.new('^[ao]s?[[:blank:]]+|^the[[:blank:]]+|\Aan[[:blank:]]+|^u[mn]a?s?\s+', true)
    if self.brazilian_title
      self.brazilian_title = self.brazilian_title.strip.squeeze('
        ').nome_proprio
      str = self.brazilian_title.sub(re, '')
      self.brazilian_title = str + ", #{Regexp.last_match.to_s.sub(/\s/, '')}" if
      Regexp.last_match
    end
    if self.title
      self.title = self.title.strip.squeeze(' ').titleize
      str = self.title.sub(re, '')
      self.title = str + ", #{$~.to_s.sub(/\s/, '')}" if $~
    end
    
  end

  
end
