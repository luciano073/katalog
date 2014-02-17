json.array!(@artists) do |artist|
  json.extract! artist, :name, :birthday
  json.url artist_url(artist, format: :html)
  json.img_url artist.photo.url(:mini)
end