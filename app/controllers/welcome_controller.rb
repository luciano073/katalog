class WelcomeController < ApplicationController
  respond_to :html, :json
  def index
    @artists = Artist.random.limit 20
    @films = Film.random.limit 20
    # render inline: "<%= @artist.birthday.to_s(:br_date) %>", layout: true
  end
  
  def films_prefetch
    @films = Film.random.limit 3
  end

  def artists_prefetch
    @artists = Artist.random.limit 3
  end

end
