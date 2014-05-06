class FilmsController < ApplicationController
  before_action :set_film, only: [:show, :edit, :update, :destroy]
  # before_action :set_production_team, only: [:create, :update]
  before_action :genres_list, only: [:new, :edit, :update]
  
  # GET /films
  # GET /films.json
  def index
    # @films = Film.search(params[:search]).paginate(page: params[:page], per_page: 10).order('films.brazilian_title')
    @films = Film.search(params[:search]).order('films.brazilian_title').page(params[:page])

    respond_to do |format|
      format.html
      format.pdf {
        render pdf: "films-list-report",
        header: {center: "Filmes cadastrados em: #{I18n.l Date.today}"},
        footer: {center: "[page] de [topage]"}
      }
    end
  end

  def search
    @films = Film.search(params[:q])
    # @films = Film.random.limit 3
  end
  # GET /films/1
  # GET /films/1.json
  def show
    @imageable = @film
    @pictures = @imageable.pictures
    @picture = Picture.new
  end

  # GET /films/new
  def new
    @film = Film.new    
  end

  # GET /films/1/edit
  def edit    

  end

  # POST /films
  # POST /films.json
  def create
    # render text: params
    # render text: params[:film]
    @film = Film.new(film_params)
    # @film.cast_ids = params[:film][:cast_ids]         # force to call
    # @film.writer_ids = params[:film][:writer_ids]     # methods _ids
    # @film.director_ids = params[:film][:director_ids] # for new records
    # As tres atribuicoes acima sao para forcar a chamada aos respectivos meto-
    # dos que nao estavam sendo chamados quando da criacao de novos filmes.

    # render inline: "<%= @film.production_team.inspect %>"
    respond_to do |format|
      if @film.save
        format.html { redirect_to @film, notice: 'Filme criado com sucesso.' }
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
        format.html { redirect_to @film, notice: 'Filme atualizado com sucesso.' }
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
        :cast_ids, :writer_ids, :director_ids, :poster_cache, :country_id, :length, :remove_poster)
    end


    def genres_list
      @genres = [
        {id: 1, name: "Ação"},
        {id: 2, name: "Aventura"},
        {id: 3, name: "Drama"},
        {id: 4, name: "Animação"},
        {id: 5, name: "Comédia"},
        {id: 6, name: "Ficção"},
        {id: 7, name: "Terror"},
        {id: 8, name: "Faroeste"},
        {id: 9, name: "Suspense"},
        {id: 10, name: "Policial"},
        {id: 11, name: "Romance"},
        {id: 12, name: "Guerra"},
        {id: 13, name: "Fantasia"}
      ].sort_by {|e| e[:name]}
    end
end
