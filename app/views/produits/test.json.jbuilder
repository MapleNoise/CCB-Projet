json.array!(@produits) do |produit|
	json.extract! produit, :ref, :nom, :description
	json.type_produit TypeProduit.find_by(:id => produit.type_produits_id).nom

	produit.tags.each do |tag|
	  if (tag.mere == nil)
	    json.etape tag.nom
	  else
	  	json.categorie tag.nom
	  end
	end
end