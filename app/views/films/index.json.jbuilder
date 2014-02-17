json.array!(@films) do |film|
  json.extract! film, :title, :brazilian_title, :release, :synopse, :poster
  json.img_url film.poster.url(:mini)
  json.url film_url(film, format: :html)
end
