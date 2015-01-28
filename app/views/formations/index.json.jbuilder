json.array!(@formations) do |formation|
  json.extract! formation, :id, :ref, :nom, :descriptionCourte, :description, :estPublic, :dateSuppression
  json.url formation_url(formation, format: :json)
end
