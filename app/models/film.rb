class Film < ActiveRecord::Base
  attr_reader              :poster_cache
  attr_reader              :cast_ids, :writer_ids, :director_ids
  attr_accessor            :cast_has_changed, :writers_has_changed, :directors_has_changed
  mount_uploader           :poster, PosterUploader #Gem carrierwave
  has_many                 :production_team, dependent: :destroy
  has_many                 :artists, :through => :production_team
  belongs_to               :country
  scope                    :random, -> {order('random()')}

  after_initialize do
    self.release               = self.release.to_s(:br_date) if self.release
    @cast_ids                  = self.cast.map(&:id)
    @writer_ids                = self.writers.map(&:id)
    @director_ids              = self.directors.map(&:id)
    self.cast_has_changed      = false
    self.writers_has_changed   = false
    self.directors_has_changed = false
    

    if not self.artist_ids.empty? and self.cast.empty? and self.writers.empty? and self.directors.empty?
      self.cast_ids += self.artist_ids      
    end
  end

  before_save :set_production_team, on: [:create, :update], if: :production_team_has_changed?
  before_save :bd_title, on: [:create, :update]
  
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
    if self.cast_has_changed or self.writers_has_changed or self.directors_has_changed or self.new_record?
      return true
    else
      return false
    end
  end

  def cast_ids=(ids)
    if not self.new_record? and @cast_ids
      unless @cast_ids.map { |e| e.to_s } == ids.split(",")
        self.cast_has_changed = true    
      end
    end
    if ids.kind_of? String
      @cast_ids = ids.split(",")
    else
      @cast_ids = ids
    end
    
  end

  def director_ids=(ids)
    if not self.new_record? and @director_ids
      unless @director_ids.map { |e| e.to_s } == ids.split(",")
        self.directors_has_changed = true
      end
    end
    if ids.kind_of? String
      @director_ids = ids.split(",")
    else
      @director_ids = ids
    end
  end

  def writer_ids=(ids)
    if not self.new_record? and @writer_ids 
      unless @writer_ids.map { |e| e.to_s } == ids.split(",")
        self.writers_has_changed = true    
      end
    end
    if ids.kind_of? String
      @writer_ids = ids.split(",")
    else
      @writer_ids = ids
    end
    
  end

  def self.search(search)
    if search
      where('i_unaccent(films.brazilian_title) ILIKE i_unaccent(?)', "%#{search}%")
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
    re_t = /\s+[ixv]{,3}\z/i # for titles with II, III and so on
    if self.brazilian_title
      self.brazilian_title = self.brazilian_title.strip.squeeze(' ').nome_proprio
      str = self.brazilian_title.sub(re, '')
      self.brazilian_title = str + ", #{Regexp.last_match.to_s.sub(/\s/, '')}" if
      Regexp.last_match
      str =~ re_t
      self.brazilian_title = self.brazilian_title.sub(re_t, $~.to_s.upcase)
    end
    if self.title
      self.title = self.title.strip.squeeze(' ').titleize
      str = self.title.sub(re, '')
      self.title = str + ", #{$~.to_s.sub(/\s/, '')}" if $~
      str =~ re_t
      self.title = self.title.sub(re_t, $~.to_s.upcase)
    end
    
  end

  
end
