class WelcomeController < ApplicationController
  def index
    @artists = Artist.random.limit 20
    @films = Film.random.limit 20
    # render inline: "<%= @artist.birthday.to_s(:br_date) %>", layout: true
  end
end
