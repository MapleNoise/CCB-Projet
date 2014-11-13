class AddFieldsToUtilisateur < ActiveRecord::Migration
  def change
    add_column :utilisateurs, :pseudo, :string
    add_column :utilisateurs, :nom, :string
    add_column :utilisateurs, :prenom, :string
    add_column :utilisateurs, :mail, :string
    add_column :utilisateurs, :mdp, :string
    add_column :utilisateurs, :dateCreation, :datetime
    add_column :utilisateurs, :dateModification, :datetime
    add_column :utilisateurs, :dateSuppression, :datetime
  end
end
