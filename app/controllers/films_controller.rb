class FilmsController < ApplicationController
  before_action :set_film, only: [:show, :edit, :update, :destroy]
  # before_action :set_production_team, only: [:create, :update]
  before_action :genres_list, only: [:new, :edit, :update]
  
  # GET /films
  # GET /films.json
  def index
    @films = Film.search(params[:search]).paginate(page: params[:page], per_page:
      10).order('films.brazilian_title')
  end

  # GET /films/1
  # GET /films/1.json
  def show
  end

  # GET /films/new
  def new
    @film = Film.new    
  end

  # GET /films/1/edit
  def edit    

    # @directors = []
    # @cast = []
    # @writers = []
    # @film.production_team.each do |e|
    #   @directors << e.artist if e.director?
    #   @writers << e.artist if e.writer?
    #   @cast << e.artist if e.cast?
    #   if (!e.cast? and !e.director? and !e.writer?)        
    #     @cast << e.artist
    #   end
    # end
    # @country = []
  end

  # POST /films
  # POST /films.json
  def create
    # render text: params
    # render text: params[:film]
    @film = Film.new(film_params)
    @film.cast_tokens = params[:film][:cast_tokens]         # force to call
    @film.writer_tokens = params[:film][:writer_tokens]     # methods _tokens
    @film.director_tokens = params[:film][:director_tokens] # for new records
    # As tres atribuicoes acima sao para forcar a chamada aos respectivos meto-
    # dos que nao estavam sendo chamados quando da criacao de novos filmes.

    # render inline: "<%= @film.production_team.inspect %>"
    respond_to do |format|
      if @film.save
        format.html { redirect_to @film, notice: 'Film was successfully created.' }
        format.json { render action: 'show', status: :created, location: @film }
      else
        format.html { render action: 'new' }
        format.json { render json: @film.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /films/1
  # PATCH/PUT /films/1.json
  def update
    respond_to do |format|
      if @film.update(film_params)
        format.html { redirect_to @film, notice: 'Film was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @film.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /films/1
  # DELETE /films/1.json
  def destroy
    @film.destroy
    respond_to do |format|
      format.html { redirect_to films_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_film
      @film = Film.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def film_params
      params.require(:film).permit(:title, :brazilian_title, :release, :synopse, :poster, :genre,
        :cast_tokens, :writer_tokens, :director_tokens, :poster_cache, :country_id, :length)
    end

    # def set_production_team
    #   directors = []
    #   writers = []
    #   cast = []
    #   params.each do |k,v|
    #     if v.is_a?(Hash)
    #       str = v.delete(:director_tokens)
    #       directors = str.split(',') unless str.blank?
    #       str = v.delete(:writer_tokens)
    #       writers = str.split(',') unless str.blank?
    #       str = v.delete(:cast_tokens)
    #       cast = str.split(',') unless str.blank?
    #     end
    #   end

    
    #   if params[:action] == 'update'
    #     @film = Film.find(params[:id])
    #     @film.production_team.clear
    #     unless directors.empty?
    #       directors.each do |d|
    #         @film.production_team.build(artist_id: d.to_i, director: true)
    #       end
    #     end

    #     unless writers.empty?
    #       writers.each do |w|
    #         @film.production_team.build(artist_id: w.to_i, writer: true)
    #       end
    #     end

    #     unless cast.empty?
    #       cast.each do |c|
    #         @film.production_team.build(artist_id: c.to_i, cast: true)
    #       end
    #     end

    #   else
    #     @film = Film.new(film_params)
    #     unless directors.empty?
    #       directors.each do |d|
    #         @film.production_team.build(artist_id: d.to_i, director: true)
    #       end
    #     end

    #     unless writers.empty?
    #       writers.each do |w|
    #         @film.production_team.build(artist_id: w.to_i, writer: true)
    #       end
    #     end

    #     unless cast.empty?
    #       cast.each do |c|
    #         @film.production_team.build(artist_id: c.to_i, cast: true)
    #       end
    #     end

    #   end
              
    # end

    def genres_list
      @genres = {
                  "Ação/Aventura" => "Ação/Aventura",
                  "Comédia"       => "Comédia",
                  "Drama"         => "Drama",
                  "Terror"        => "Terror",
                  "Animação"      => "Animação",
                  "Ficção"        => "Ficção"
                }.sort
    end
end
