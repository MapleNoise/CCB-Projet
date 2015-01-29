class AddUrlFileToProduit < ActiveRecord::Migration
  def change
    add_column :produits, :urlFichier, :string
  end
end
