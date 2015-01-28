class PurgeDateCreationModificationToAllBases < ActiveRecord::Migration
  def up
    # Table utilisateurs
    #remove_column :utilisateurs, :mail, :string
    #remove_column :utilisateurs, :dateModification, :datetime
    #remove_column :utilisateurs, :dateCreation, :datetime
    
    # Table produits
    remove_column :produits, :dateModification, :datetime
    remove_column :produits, :dateCreation, :datetime
    
    # Table fiche_produits
    remove_column :fiche_produits, :dateModification, :datetime
    remove_column :fiche_produits, :dateCreation, :datetime
    
    # Table categories
    remove_column :categories, :dateModification, :datetime
    remove_column :categories, :dateCreation, :datetime
    
    # Table param_tvas
    remove_column :param_tvas, :dateModification, :datetime
    remove_column :param_tvas, :dateCreation, :datetime
  end
  
  def down
    # Table utilisateurs
    add_column :utilisateurs, :mail, :string
    add_column :utilisateurs, :dateModification, :datetime
    add_column :utilisateurs, :dateCreation, :datetime
    
    # Table produits
    add_column :produits, :dateModification, :datetime
    add_column :produits, :dateCreation, :datetime
    
    # Table fiche_produits
    add_column :fiche_produits, :dateModification, :datetime
    add_column :fiche_produits, :dateCreation, :datetime
    
    # Table categories
    add_column :categories, :dateModification, :datetime
    add_column :categories, :dateCreation, :datetime
    
    # Table param_tvas
    add_column :param_tvas, :dateModification, :datetime
    add_column :param_tvas, :dateCreation, :datetime
    
  end
end
