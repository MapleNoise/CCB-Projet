class RemoveRoleTable < ActiveRecord::Migration
  def change
    drop_table :roles
    drop_table :utilisateurs_roles
    drop_table :categories
    drop_table :utilisateurs
    drop_table :fiche_produits
    drop_table :formats
  end
end
