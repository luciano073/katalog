class ProfessionsController < ApplicationController
  before_action :set_profession, only: [:edit, :update, :destroy]

  def index
    @professions = Profession.all
  end

  def new
    @profession = Profession.new
  end

  def edit
    
  end

  def create
    @profession = Profession.new(profession_params)
    respond_to do |format|
      if @profession.save
        format.html {redirect_to professions_url, notice: "Profissao criada com sucesso."}
      else
        format.html {render action: 'new'}
      end
    end
  end

  def update
    respond_to do |format|
      if @profession.update(profession_params)
        format.html {redirect_to professions_url, notice: 'Profissao atualizada com sucesso.'}
      else
        format.html {render action: 'edit'}
      end
    end
  end

def destroy
    @profession.destroy
    respond_to do |format|
      format.html {redirect_to professions_url}
    end
end

  private

  def profession_params
    params.require(:profession).permit(:name)
  end

  def set_profession
    @profession = Profession.find(params[:id])
  end
end
