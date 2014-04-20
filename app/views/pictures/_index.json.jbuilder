json.array!(@pictures) do |picture|
  json.extract! picture, :image, :info, :artist
  json.url picture_url(picture, format: :json)
end
