json.array!(@produits) do |produit|
  json.extract! produit, :id, :ref, :nom, :prix, :dateCreation, :dateModification, :dateSuppression
  json.url produit_url(produit, format: :json)
end
