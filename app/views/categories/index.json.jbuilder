json.array!(@categories) do |category|
  json.extract! category, :id, :nom, :mere, :dateCreation, :dateModification, :dateSuppression
  json.url category_url(category, format: :json)
end
