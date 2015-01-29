class UpdateUtilisateur < ActiveRecord::Migration
  def change
    add_column :utilisateur2s, :nom , :string
    add_column :utilisateur2s, :prenom , :string
    remove_column :utilisateur2s, :name 
  end
end
