json.array!(@countries) do |country|
  json.extract! country, :id , :name, :english_name #, :url_16
  # json.text country.name
  json.url_16 country.url_16
  json.url country_url(country, format: :json)
end
