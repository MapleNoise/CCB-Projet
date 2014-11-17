json.array!(@type_produits) do |type_produit|
  json.extract! type_produit, :id, :nom, :format
  json.url type_produit_url(type_produit, format: :json)
end
