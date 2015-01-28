json.extract! @produit, :id, :ref, :nom, :prix, :dateSuppression, :created_at, :updated_at
json.extract! TypeProduit.find_by(:id => 1).to_json