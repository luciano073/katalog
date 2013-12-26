class Film < ActiveRecord::Base
  attr_reader :cast_tokens
  attr_reader :director_tokens
  attr_reader :writer_tokens
  attr_reader :poster_cache
  attr_accessor :cast, :writers, :directors
  

  after_find do
    self.release = self.release.to_s(:br_date) if self.release
  end
  before_save :set_production_team, on: [:create, :update]
  before_save :bd_title, on: [:create, :update]

  mount_uploader :poster, PosterUploader #Gem carrierwave
  has_many :production_team, dependent: :destroy
  has_many :artists, :through => :production_team

  # has_and_belongs_to_many :prizes, :join_table => "PrizeEdition"
  # has_and_belongs_to_many :media

  scope :random, -> {order('random()')}

  
  def cast_names
    cast = self.production_team.map { |e| e.artist if e.cast? }.compact
    cast.map(&:name).join(", ") unless cast.empty?
  end

  def directors_names
    directors = self.production_team.map { |e| e.artist if e.director? }.compact
    directors.map(&:name).join(", ") unless directors.empty?
  end

  def writers_names
    writers = self.production_team.map { |e| e.artist if e.writer? }.compact
    writers.map(&:name).join(", ") unless writers.empty?
  end

  def cast_tokens=(ids)
    # self.artist_ids = ids.split(",")
    # self.cast.clear unless self.cast.empty?
    self.cast = ids.split(",")
  end

  def director_tokens=(ids)
    # self.artist_ids = ids.split(",")
    # self.directors.clear unless self.directors.empty?
    self.directors = ids.split(",")
  end

  def writer_tokens=(ids)
    # self.artist_ids = ids.split(",")
    # self.writers.clear unless self.writers.empty?
    self.writers = ids.split(",")
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
    unless self.directors.empty?
      self.directors.each do |d|
        self.production_team.build(artist_id: d.to_i, director: true)
      end
    end

    unless self.writers.empty?
      self.writers.each do |w|
        self.production_team.build(artist_id: w.to_i, writer: true)
      end
    end

    unless self.cast.empty?
      self.cast.each do |c|
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
