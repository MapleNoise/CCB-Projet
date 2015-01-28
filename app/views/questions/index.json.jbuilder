json.array!(@questions) do |question|
  json.extract! question, :id, :nom, :dateSuppression
  json.url question_url(question, format: :json)
end
