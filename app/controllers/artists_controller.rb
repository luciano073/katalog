class ArtistsController < ApplicationController
  respond_to :html, :json
  before_action :set_artist, only: [:show, :edit, :update, :destroy]
  before_action :countries_list, only: [:new, :edit]
  

	def index
    @artists = Artist.search(params[:search]).paginate(page: params[:page], per_page: 10).order('artists.name')
    respond_with @artists.as_json(only: [:id, :name])
	end

## Only to attend autocomplete plugin tokenInput
  def writers
    @artists = Artist.writers.search(params[:q])
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
  end

  def edit
  end

  def create
    # render inline: "<%= params[:action] %>"
    @artist = Artist.new(artist_params)
    respond_to do |format|
      if @artist.save
        format.html { redirect_to @artist, notice: 'Artist was successfully created.' }
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
        format.html { redirect_to @artist, notice: 'Artist was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @artist.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def destroy
    @artist.destroy
    respond_to do |format|
      format.html { redirect_to films_url }
      format.json { head :no_content }
    end
  end

  private

  def set_artist
    @artist = Artist.find(params[:id])
  end

  def countries_list
    @countries = [
                  "Brasil"        , 'Estados Unidos' , "Inglaterra" , 
                  "Espanha"       , "Canadá"         , "Australia"  , 
                  "França"        , "Alemanha"       , "Portugal"   , 
                  "Coreia do Sul" , "Japão"          , "Líbano"     , 
                  "México"        , "Irã"            , "Chile"      ,
                  "Argentina" 
                 ].sort
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def artist_params
    params.require(:artist).permit(:name, :real_name, :profession_tokens,
      :birthday, :country, :photo, :height, :death)
    # params.require(:film).permit(:artist_tokens)
  end

  def date_format
    set_artist
    @artist.birthday = @artist.birthday.to_s(:br_date)
  end
  
end
