json.array!(@produits) do |produit|
  json.extract! produit, :id, :ref, :nom, :prix, :dateSuppression
  json.url produit_url(produit, format: :json)
end
