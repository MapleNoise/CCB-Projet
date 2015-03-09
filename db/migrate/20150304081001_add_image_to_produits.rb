class AddImageToProduits < ActiveRecord::Migration
  def change
    add_column :produits, :image, :string
  end
end
