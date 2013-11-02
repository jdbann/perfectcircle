json.array!(@albums) do |album|
  json.extract! album, :title, :date
  json.url album_url(album, format: :json)
end
