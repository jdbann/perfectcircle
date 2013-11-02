json.array!(@projects) do |project|
  json.extract! project, :title, :body, :location, :project_date, :expiry_date, :extended
  json.url project_url(project, format: :json)
end
