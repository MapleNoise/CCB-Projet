json.array!(@fiche_produits) do |fiche_produit|
  json.extract! fiche_produit, :id, :ref, :titre, :description, :descriptionCourte, :datePublication, :dateCreation, :dateModification, :dateSuppression
  json.url fiche_produit_url(fiche_produit, format: :json)
end
