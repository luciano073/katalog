class AdvancedSearchController < ApplicationController
  def index
  end

  def range_release
    @inicial_day = if params[:inicial_release].empty?
      "01/01/#{Date.today.year}".to_date
    else
      params[:inicial_release].to_date
    end 
    @final_day = if params[:final_release].empty?
      Date.today
    else
      params[:final_release].to_date
    end
    @films = Film.where(release: @inicial_day.to_s..@final_day.to_s).order(:release).page(params[:page]).per(20)
  end
end
