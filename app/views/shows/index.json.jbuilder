json.array!(@shows) do |show|
  json.extract! show, :title, :author, :body, :expiry_date, :extended, :author_date
  json.url show_url(show, format: :json)
end
