class UtilisateurProduitLiaison < ActiveRecord::Migration
  def change
  	add_reference :produits, :utilisateur2s
  end
end
