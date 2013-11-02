json.array!(@photos) do |photo|
  json.extract! photo, :album_id
  json.url photo_url(photo, format: :json)
end
