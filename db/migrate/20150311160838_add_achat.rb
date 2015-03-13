class AddAchat < ActiveRecord::Migration
  def change
      # pour test
      # remove_reference :produits, :utilisateur2s
     	create_join_table :produits, :utilisateur2s
      create_join_table :formations, :utilisateur2s
  end
end
