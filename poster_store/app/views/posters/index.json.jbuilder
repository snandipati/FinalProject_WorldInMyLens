json.array!(@posters) do |poster|
  json.extract! poster, :id, :title, :price
  json.url poster_url(poster, format: :json)
end
