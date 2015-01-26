json.array!(@chapitres) do |chapitre|
  json.extract! chapitre, :id, :ref, :nom, :description, :texte, :dateSuppression
  json.url chapitre_url(chapitre, format: :json)
end
