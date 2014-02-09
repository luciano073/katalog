class WelcomeController < ApplicationController
  def index
    @artists = Artist.random.limit 20
    @films = Film.random.limit 20
    # render inline: "<%= @artist.birthday.to_s(:br_date) %>", layout: true
  end

  def search
    @artists = Artist.search(params[:g_search]).order(:name)
    @films = Film.search(params[:g_search]).order(:brazilian_title)
    @term = params[:g_search]
  end
end
