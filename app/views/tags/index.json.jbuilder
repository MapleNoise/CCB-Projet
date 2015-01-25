json.array!(@tags) do |category|
  json.extract! tag, :id, :nom, :mere, :dateCreation, :dateModification, :dateSuppression
  json.url tag_url(tag, format: :json)
end
