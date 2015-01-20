class AjoutDesLiaisons < ActiveRecord::Migration
  def change
  	add_reference(:fiche_produits, :param_tvas)
  	add_reference(:fiche_produits, :produits)
  	create_join_table :produits, :categories
  	add_reference(:produits, :type_produits)
  	add_reference(:type_produits, :formats)
  end
end
