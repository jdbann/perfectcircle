json.array!(@news) do |news|
  json.extract! news, :title, :body
  json.url news_url(news, format: :json)
end
