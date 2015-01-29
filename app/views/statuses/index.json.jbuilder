json.array!(@statuses) do |status|
  json.extract! status, :id, :nom
  json.url status_url(status, format: :json)
end
