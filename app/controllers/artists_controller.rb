class ArtistsController < ApplicationController
  respond_to :html, :json
  include ActionView::Helpers::NumberHelper
  before_action :set_artist, only: [:show, :edit, :update, :destroy]
  

	def index
    # @artists = Artist.search(params[:search]).order('artists.name').paginate(page: params[:page], per_page: 2)
    @artists = Artist.search(params[:search]).order('artists.name').page(params[:page])

    respond_to do |format|
      format.html
      format.json {@artists.as_json(only: [:id, :name])}
      format.pdf {
        render pdf: "artists-list-report",
        encoding: 'utf-8',
        header: {center: "[ #{I18n.l Date.today, format: '%d.%m.%Y'} - #{number_with_delimiter(Artist.count)} artistas cadastrados. ]"},
        footer: {center: "[page] de [topage]"}
      }
    end
	end
  def search
    @artists = Artist.search(params[:q])
    # @artists = Artist.random.limit 3
  end
## Only to attend autocomplete plugin tokenInput
  def writers
    @artists = Artist.writers.uniq.search(params[:q])
    respond_with @artists.as_json(only: [:id, :name])
  end
  def directors
    @artists = Artist.directors.search(params[:q])
    respond_with @artists.as_json(only: [:id, :name])
  end
  def cast
    @artists = Artist.cast.search(params[:q])
   respond_with @artists.as_json(only: [:id, :name]) 
  end
## end actions to token input

  def new
    @artist = Artist.new
    # @picture = @artist.pictures.build      
  end

  def edit
    @imageable = @artist
    @pictures = @imageable.pictures
    @picture = Picture.new
  end

  def create
    # render inline: "<%= params[:action] %>"
    @artist = Artist.new(artist_params)
    respond_to do |format|
      if @artist.save
        # params[:pictures]['image'].each do |p|
        #   @pictures = @artist.pictures.create!(image: p, imageable_id: @artist.id, imageable_type: "Artist")
        # end
        format.html { redirect_to @artist, notice: 'Artista criado com sucesso.' }
        format.json { render action: 'show', status: :created, location: @artist }
      else
        format.html { render action: 'new' }
        format.json { render json: @artist.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @artist.update(artist_params)
        # @artist.pictures.clear
        # params[:pictures]['image'].each do |p|
        #   @pictures = @artist.pictures.create!(image: p, imageable_id: @artist.id, imageable_type: "Artist")
        # end
        format.html { redirect_to @artist, notice: 'Artista atualizado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @artist.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @imageable = @artist
    @pictures = @imageable.pictures
    @picture = Picture.new
  end

  def destroy
    @artist.destroy
    respond_to do |format|
      format.html { redirect_to artists_url }
      format.json { head :no_content }
    end
  end

  private

  def set_artist
    @artist = Artist.find(params[:id])

  end

  
  # Never trust parameters from the scary internet, only allow the white list through.
  def artist_params
    params.require(:artist).permit(:name, :real_name, :profession_tokens,
      :birthday, :country_id, :photo, :height, :death, :remove_photo)
    # params.require(:film).permit(:artist_tokens)
  end

    
end
