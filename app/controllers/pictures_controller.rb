class PicturesController < ApplicationController
  # before_action :set_picture, only: [:show, :edit, :update, :destroy]
  respond_to :js, :html
  # before_action :load_model, only: [:create, :destroy]
  before_action :load_imageable
  # GET /pictures
  # GET /pictures.json
  def index
    # @pictures = Picture.all
    @pictures = @imageable.pictures
  end

  # GET /pictures/1
  # GET /pictures/1.json
  def show
  end

  # GET /pictures/new
  def new
    # @picture = @artist.pictures.new
    @picture = @imageable.pictures.new
  end

  # GET /pictures/1/edit
  def edit
  end

  # POST /pictures
  # POST /pictures.json
  def create
    # @picture = @artist.pictures.create(picture_params)    
    @picture = @imageable.pictures.create(picture_params)    
  end

  # PATCH/PUT /pictures/1
  # PATCH/PUT /pictures/1.json
  def update
    respond_to do |format|
      if @picture.update(picture_params)
        format.html { redirect_to @artist, notice: 'Picture was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pictures/1
  # DELETE /pictures/1.json
  def destroy
    # @picture = @artist.pictures.find(params[:id])
    @picture = @imageable.pictures.find(params[:id])
    # @picture = params[:id]
    @picture.destroy
    respond_to do |format|
      # format.html { redirect_to @artist, notice: "Imagem excluida com sucesso." }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_picture
      # @picture = Picture.find(params[:id])
    end

    def load_model
      # @model = Artist.find(params[:artist_id]) if params[:artist_id]
      # @model = Film.find(params[:film_id]) if params[:film_id]
      # case 
      # when params[:artist_id]
      #   @artist = Artist.find(params[:artist_id])
      # when params[:film_id]
      #   @film = Film.find(params[:film_id])  
      # end
    end

    def load_imageable
        resource, id = request.path.split('/')[1, 2]
        @imageable = resource.singularize.classify.constantize.find(id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def picture_params
      params.require(:picture).permit(:image, :info, :artist_id, :film_id)
    end
end
