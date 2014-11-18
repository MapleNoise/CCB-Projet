json.array!(@utilisateurs) do |utilisateur|
  json.extract! utilisateur, :id, :email, :dateCreation, :dateModification, :nom, :prenom
  json.url utilisateur_url(utilisateur, format: :json)
end
