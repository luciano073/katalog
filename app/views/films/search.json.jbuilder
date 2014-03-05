json.array!(@films) do |film|
  json.extract! film, :title, :brazilian_title, :release
  json.url film_url(film, format: :html)
  json.img_url film.poster.url(:mini)
  json.year film.release.year if film.release
end