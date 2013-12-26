json.array!(@films) do |film|
  json.extract! film, :title, :brazilian_title, :release, :synopse, :poster
  json.url film_url(film, format: :json)
end
