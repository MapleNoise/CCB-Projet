#encoding: UTF-8
class RefonteProduitFicheProduit < ActiveRecord::Migration
  
  def change
    # Corrige une erreur dans la liaison format / type produit
    remove_reference :type_produits, :formats
    add_reference :formats, :type_produits
    
    # Supprime la liaison entre Fiche produit et produit
    remove_reference :fiche_produits, :produits
    
    # Supprime la liaison entre ParamTVA et Fiche produit
    remove_reference :fiche_produits, :param_tvas
    
    # Ajout des colonnes manquantes à produit
    add_column :produits, :description, :text
    add_column :produits, :descriptionCourte, :text
    add_column :produits, :datePublication, :datetime
    add_column :produits, :estPublic, :boolean
    
    # Nouvelle table équivalente à catégorie il faut changer 
    # le nom à cause de rails et sa convention de pluriel à l'anglaise...
    create_table :tags do |t|
      t.string :nom
      t.integer :mere
      t.datetime :dateSuppression

      t.timestamps
    end
    
    # Suppression des liaisons pour catégorie
    drop_join_table :produits, :categories
    
    # Ajout des réfèrences pour tags
    create_join_table :produits, :tags
    
  end
  
end
