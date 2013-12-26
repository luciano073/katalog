json.array!(@media) do |medium|
  json.extract! medium, :type, :release_date, :pakage, :qtd_discs, :price, :price, :art, :distribuidora
  json.url medium_url(medium, format: :json)
end
